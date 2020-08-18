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