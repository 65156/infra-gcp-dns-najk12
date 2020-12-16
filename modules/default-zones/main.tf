resource "google_dns_managed_zone" "private" {
  name        = var.dns_private_zone_name
  dns_name    = var.dns_private_zone
  description = "${var.dns_description} DNS Zone"
  project     = var.project

  labels = {
    application_name = "dns"
    environment      = var.environment
    team             = "ice"
    project          = ""
    repository       = "infra-gcp-dns"
  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.network
    }
  }

}

resource "google_dns_managed_zone" "public" {
  name        = var.dns_public_zone_name
  dns_name    = var.dns_public_zone
  description = "${var.dns_description} DNS Zone"
  project     = var.project

  labels = {
    application_name = "dns"
    environment      = var.environment
    team             = "ice"
    project          = ""
    repository       = "infra-gcp-dns"
  }

}


resource "google_dns_policy" "private" {
  # unable to export inbound, forwarder ips, # bug tracking 
  # https://github.com/hashicorp/terraform-provider-google/issues/3753
  # https://issuetracker.google.com/issues/169585798
  name                      = "inbound-policy"
  enable_inbound_forwarding = true
  enable_logging            = true
  project                   = "${var.peering_network == null ? var.project : var.peering_project}"
  description               = "repository:infra-gcp-dns"
  networks {
    network_url = "${var.peering_network == null ? var.network : var.peering_network}"
  }
}

###### Peering Zones #######
resource "google_dns_managed_zone" "peering" {
  count       = "${var.peering_network != null ? 1 : 0}"
  name        = var.dns_private_zone_name
  dns_name    = var.dns_private_zone
  description = "${var.dns_description} DNS Peering Zone"
  project     = var.peering_project

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.peering_network
    }
  }

  peering_config {
    target_network {
      network_url = var.network
    }
  }
}