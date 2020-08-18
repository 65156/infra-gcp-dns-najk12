resource "google_dns_managed_zone" "private" {
  name        = var.dns_private_zone_name
  dns_name    = var.dns_private_zone
  description = var.dns_private_description
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
  description = var.dns_public_description
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
  # unable to export inbound, forwarder ips, tracking https://github.com/hashicorp/terraform-provider-google/issues/3753
  name                      = "private-policy"
  enable_inbound_forwarding = true
  enable_logging = true
  project     = var.project
  description = "repository:infra-gcp-dns"
  networks {
    network_url = var.network
  }
  
}