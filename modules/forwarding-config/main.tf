resource "google_dns_managed_zone" "public" {
  name        = var.dns_zone_name
  dns_name    = var.dns_zone
  description = var.dns_description
  project = var.project

  labels = {
    
  }

  forwarding_config {
    target_name_servers {
      ipv4_address = var.nameserver_01
    }
    target_name_servers {
      ipv4_address = var.nameserver_02
    }
  }
}


resource "google_dns_managed_zone" "private" {
  name        = var.dns_zone_name
  dns_name    = "private.${var.dns_zone}"
  description = var.dns_description
  project = var.project

  labels = {

  }

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.private_network
    }
    networks {
      network_url = var.public_network
    }
  }

  forwarding_config {
    target_name_servers {
      ipv4_address = var.aws_nameserver_01
    }
    target_name_servers {
      ipv4_address = var.aws_nameserver_02
    }
  }
}