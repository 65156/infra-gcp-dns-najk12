resource "google_dns_managed_zone" "zone" {
  name        = var.dns_zone_name
  dns_name    = var.dns_zone
  description = var.dns_description
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

  forwarding_config {
    target_name_servers {
      ipv4_address = var.nameserver_01
    }
    target_name_servers {
      ipv4_address = var.nameserver_02
    }
    target_name_servers {
      ipv4_address = var.nameserver_03
    }
  }
}