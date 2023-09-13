# Google Cloud DNS Deployment
Deploys Core DNS Infrastructure and Configures DNS Zone Exchange with AWS

## Topology
![Topology](https://raw.githubusercontent.com/frasercarter/infra-gcp-dns-najk12/fraser/DNS.jpg)

## Variables

  ## DNS Zones
    # General
    environment     = Environment Abreviation eg. "Dev"
    dns_description = Zone Descriotion for Dns Zone
  
    # Private Zones
    dns_private_zone_name = # name of the private zone, eg. "gcp-dev-private"      
    dns_private_zone      = # zone address in format "foo.bar." eg. "private.dev.gcp.ofx.com." 
  
    # Public Zones
    dns_public_zone_name = # name of the public zone eg. "gcp-dev-public"   
    dns_public_zone      = # zone address in format "foo.bar. eg. "dev.gcp.ofx.com."
  
    # VPC Association
    network         = local.management_vpc # in format "projects/{project}/global/networks/{network}"
    peering_network = Reference to existing id from terraform state / Export eg. d"ata.terraform_remote_state.network.outputs.management_vpc_network"
    peering_project = ""
  
  ## Forwarding Zones
    # Nameservers, Local IPs of Nameservers on destination network (AWS)
    nameserver_01 = "10.128.2.232"
    nameserver_02 = "10.128.5.51"
    nameserver_03 = "10.128.8.30"

    # VPC Selection
    network = # Reference to shared VPC that will house the DNZ Forwarders in format "projects/{project}/global/networks/{network}" 
    peering_network = # reference to the VPC the DNS Peering zones will be associated
    peering_project = # reference to the project that maintains the above.

## References
