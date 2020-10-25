locals {
mgmt_network_project = "barbados-mgmt-583929"
management_vpc = data.terraform_remote_state.network.outputs.management_vpc_network

dev_network_project = "barbados-dev-583929"
dev_vpc = data.terraform_remote_state.network.outputs.development_vpc_network

stage_network_project = "barbados-stage-583929"
stage_vpc = data.terraform_remote_state.network.outputs.staging_vpc_network

prod_network_project = "barbados-prod-583929"
prod_vpc = data.terraform_remote_state.network.outputs.production_vpc_network
}

module "dev" {
  source             = ".//modules/default-zones"

  environment = "dev"
  project = "${local.dev_network_project}" 

  #Zone Names
  dns_private_zone_name = "gcp-dev-private" # name of the zone
  dns_private_zone = "private.dev.gcp.ofx.com." # zone address in format "foo.bar."
  dns_private_description = "Development DNS Zone "

  dns_public_zone_name = "gcp-dev-public" # name of the zone
  dns_public_zone = "dev.gcp.ofx.com." # zone address in format "foo.bar."
  dns_public_description = "Development DNS Zone "

  # networks
  network = local.dev_vpc# in format "projects/{project}/global/networks/{network}"
}

module "stage" {
  source             = ".//modules/default-zones"

  environment = "stage"
  project = "${local.stage_network_project}" 

  #Zone Names
  dns_private_zone_name = "gcp-stage-private" # name of the zone
  dns_private_zone = "private.stg.gcp.ofx.com." # zone address in format "foo.bar."
  dns_private_description = "Staging DNS Zone "

  dns_public_zone_name = "gcp-stage-public" # name of the zone
  dns_public_zone = "stg.gcp.ofx.com." # zone address in format "foo.bar."
  dns_public_description = "Staging DNS Zone "

  # networks
  network = local.stage_vpc# in format "projects/{project}/global/networks/{network}"
}

module "prod" {
  source             = ".//modules/default-zones"

  environment = "prod"
  project = "${local.prod_network_project}" 

  #Zone Names
  dns_private_zone_name = "gcp-prod-private" # name of the zone
  dns_private_zone = "private.prd.gcp.ofx.com." # zone address in format "foo.bar."
  dns_private_description = "Production DNS Zone "

  dns_public_zone_name = "gcp-prod-public" # name of the zone
  dns_public_zone = "prd.gcp.ofx.com." # zone address in format "foo.bar."
  dns_public_description = "Production DNS Zone"

  # networks
  network = local.prod_vpc # in format "projects/{project}/global/networks/{network}"
}

module "mgmt" {
  source             = ".//modules/default-zones"

  environment = "mgt"
  project = "${local.mgmt_network_project}" 

  #Zone Names
  dns_private_zone_name = "gcp-mgt-private" # name of the zone
  dns_private_zone = "private.mgt.gcp.ofx.com." # zone address in format "foo.bar."
  dns_private_description = "Management DNS Zone "

  dns_public_zone_name = "gcp-mgt-public" # name of the zone
  dns_public_zone = "mgt.gcp.ofx.com." # zone address in format "foo.bar."
  dns_public_description = "Management DNS Zone "

  # networks
  network = local.management_vpc # in format "projects/{project}/global/networks/{network}"
}
