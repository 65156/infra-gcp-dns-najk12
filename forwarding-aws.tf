
module "aws_dev" {
  source = ".//modules/forwarding-config"

  environment     = "dev"
  dns_zone_name   = "aws-dev-kumo-private"     # name of the zone
  dns_zone        = "private.dev.aws.ofx.com." # zone address in format "foo.bar."
  dns_description = "AWS Development"
  project         = local.mgmt_network_project

  # forwarding nameservers
  nameserver_01 = "10.128.2.232"
  nameserver_02 = "10.128.5.51"
  nameserver_03 = "10.128.8.30"

  # networks
  network = local.management_vpc # in format "projects/{project}/global/networks/{network}"

  #peering
  peering_network = local.development_vpc
  peering_project = local.dev_network_project
}

module "aws_stage" {
  source = ".//modules/forwarding-config"

  environment     = "stage"
  dns_zone_name   = "aws-stage-kumo-private"   # name of the zone
  dns_zone        = "private.stg.aws.ofx.com." # zone address in format "foo.bar."
  dns_description = "AWS Staging"
  project         = local.mgmt_network_project

  # forwarding nameservers
  nameserver_01 = "10.136.9.37"
  nameserver_02 = "10.136.0.16"
  nameserver_03 = "10.136.4.52"

  # networks
  network         = local.management_vpc # in format "projects/{project}/global/networks/{network}"
  peering_network = local.staging_vpc
  peering_project = local.stage_network_project
}

module "aws_prod" {
  source = ".//modules/forwarding-config"

  environment     = "prod"
  dns_zone_name   = "aws-prod-kumo-private"    # name of the zone
  dns_zone        = "private.prd.aws.ofx.com." # zone address in format "foo.bar."
  dns_description = "AWS Production"
  project         = local.mgmt_network_project

  # forwarding nameservers
  nameserver_01 = "10.144.3.2"
  nameserver_02 = "10.144.6.134"
  nameserver_03 = "10.144.8.54"

  # networks
  network         = local.management_vpc # in format "projects/{project}/global/networks/{network}"
  peering_network = local.production_vpc
  peering_project = local.prod_network_project
}
