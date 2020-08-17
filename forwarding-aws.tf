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
  nameserver_01 = "" #ip address of the nameserver to forward requests to
  nameserver_02 = ""

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
  nameserver_01 = "" #ip address of the nameserver to forward requests to
  nameserver_02 = ""

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
  nameserver_01 = "" #ip address of the nameserver to forward requests to
  nameserver_02 = ""

  # networks
  private_network = "projects/${local.prod_network_project}/global/networks/${local.prod_network_private}" # in format "projects/{project}/global/networks/{network}"
  public_network = "projects/${local.prod_network_project}/global/networks/${local.prod_network_public}"
}