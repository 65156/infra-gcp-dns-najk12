provider "google" {
  region = var.global["default_resource_region"]
}

provider "google-beta" {
  region = var.global["default_resource_region"]
}

terraform {
  backend "gcs" {
    bucket = "terraform-statefiles-xjdfh3"
    prefix = "gcp/dns"
  }
}

data "terraform_remote_state" "network" {
  backend = "gcs"
  config = {
    bucket = "terraform-statefiles-xjdfh3"
    prefix = "gcp/network"
  }
}