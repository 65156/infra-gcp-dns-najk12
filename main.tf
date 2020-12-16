locals {
  mgmt_network_project = "barbados-mgmt-583929"
  management_vpc       = data.terraform_remote_state.network.outputs.management_vpc_network

  dev_network_project = "barbados-dev-583929"
  development_vpc     = data.terraform_remote_state.network.outputs.development_vpc_network

  stage_network_project = "barbados-stage-583929"
  staging_vpc           = data.terraform_remote_state.network.outputs.staging_vpc_network

  prod_network_project = "barbados-prod-583929"
  production_vpc       = data.terraform_remote_state.network.outputs.production_vpc_network
}

module "dev" {
  source          = ".//modules/default-zones"
  environment     = "dev"
  project         = "${local.mgmt_network_project}"
  dns_description = "Development"

  # Private Zones
  dns_private_zone_name = "gcp-dev-private"          # name of the zone
  dns_private_zone      = "private.dev.gcp.ofx.com." # zone address in format "foo.bar."

  # Public Zones
  dns_public_zone_name = "gcp-dev-public"   # name of the zone
  dns_public_zone      = "dev.gcp.ofx.com." # zone address in format "foo.bar."

  # networks
  network         = local.management_vpc # in format "projects/{project}/global/networks/{network}"
  peering_network = local.development_vpc
  peering_project = local.dev_network_project
}

module "stage" {
  source          = ".//modules/default-zones"
  environment     = "stage"
  project         = "${local.mgmt_network_project}"
  dns_description = "Staging"

  # Private Zones
  dns_private_zone_name = "gcp-stage-private"        # name of the zone
  dns_private_zone      = "private.stg.gcp.ofx.com." # zone address in format "foo.bar."
  # Public Zones
  dns_public_zone_name = "gcp-stage-public" # name of the zone
  dns_public_zone      = "stg.gcp.ofx.com." # zone address in format "foo.bar."

  # Networks
  network         = local.management_vpc # in format "projects/{project}/global/networks/{network}"
  peering_network = local.staging_vpc
  peering_project = local.stage_network_project

}

module "prod" {
  source          = ".//modules/default-zones"
  environment     = "prod"
  project         = "${local.mgmt_network_project}"
  dns_description = "Production"

  # Private Zones
  dns_private_zone_name = "gcp-prod-private"         # name of the zone
  dns_private_zone      = "private.prd.gcp.ofx.com." # zone address in format "foo.bar."
  # Public Zones 
  dns_public_zone_name = "gcp-prod-public"  # name of the zone
  dns_public_zone      = "prd.gcp.ofx.com." # zone address in format "foo.bar."

  # Networks
  network         = local.management_vpc # in format "projects/{project}/global/networks/{network}"
  peering_network = local.production_vpc
  peering_project = local.prod_network_project
}

module "mgmt" {
  source          = ".//modules/default-zones"
  environment     = "mgt"
  project         = "${local.mgmt_network_project}"
  dns_description = "Management DNS Zone"

  # Private Zones
  dns_private_zone_name = "gcp-mgt-private"          # name of the zone
  dns_private_zone      = "private.mgt.gcp.ofx.com." # zone address in format "foo.bar."

  # Public Zones
  dns_public_zone_name = "gcp-mgt-public"   # name of the zone
  dns_public_zone      = "mgt.gcp.ofx.com." # zone address in format "foo.bar."

  # Networks
  network = local.management_vpc # in format "projects/{project}/global/networks/{network}"
}

