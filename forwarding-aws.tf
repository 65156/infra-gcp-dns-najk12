locals {

dev_network_project = 
dev_network_private =
dev_network_public =

stage_network_project = 
stage_network_private =
stage_network_public =

prod_network_project = 
prod_network_private =
prod_network_public =

}

module "aws_dev" {
  source             = ".//modules/forwarding-config"

  dns_zone_name = "aws-dev-kumo" # name of the zone
  dns_zone = "dev.aws.ofx.com." # zone address in format "foo.bar."
  dns_description = "AWS Development DNS Zone "
  project = "${local.dev_network_project}" 

  # forwarding nameservers
  nameserver_01 = "10.128.2.232"
  nameserver_02 = "10.128.5.51"
  nameserver_03 = "10.128.8.30"

  # networks
  private_network = "projects/${local.dev_network_project}/global/networks/${local.dev_network_private}" # in format "projects/{project}/global/networks/{network}"
  public_network = "projects/${local.dev_network_project}/global/networks/${local.dev_network_public}"
}

module "aws_stage" {
  source             = ".//modules/forwarding-config"

  dns_zone_name = "aws-stage-kumo" # name of the zone
  dns_zone = "stg.aws.ofx.com." # zone address in format "foo.bar."
  dns_description = "AWS Staging DNS Zone "
  project = "${local.stage_network_project}" 

  # forwarding nameservers
  nameserver_01 = "10.136.9.37" 
  nameserver_02 = "10.136.0.16"
  nameserver_03 = "10.136.4.52"

  # networks
  private_network = "projects/${local.stage_network_project}/global/networks/${local.stage_network_private}" # in format "projects/{project}/global/networks/{network}"
  public_network = "projects/${local.stage_network_project}/global/networks/${local.stage_network_public}"
}

module "aws_prod" {
  source             = ".//modules/forwarding-config"

  dns_zone_name = "aws-prod-kumo" # name of the zone
  dns_zone = "prd.aws.ofx.com." # zone address in format "foo.bar."
  dns_description = "AWS Production DNS Zone "
  project = "${local.prod_network_project}" 

  # forwarding nameservers
  nameserver_01 = "10.144.3.2" 
  nameserver_02 = "10.144.6.134"
  nameserver_03 = "10.144.8.54"

  # networks
  private_network = "projects/${local.prod_network_project}/global/networks/${local.prod_network_private}" # in format "projects/{project}/global/networks/{network}"
  public_network = "projects/${local.prod_network_project}/global/networks/${local.prod_network_public}"
}