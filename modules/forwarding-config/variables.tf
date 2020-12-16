
variable "dns_zone_name" {
  type = string
}
variable "environment" {
  type = string
}
variable "dns_zone" {
  type = string
}
variable "dns_description" {
  type = string
}
variable "project" {
  type = string
}
variable "nameserver_01" {
  type = string
}
variable "nameserver_02" {
  type = string
}
variable "nameserver_03" {
  type = string
}
variable "network" {
  type = string
}
variable "peering_network" {
  type    = string
  default = null
}
variable "peering_project" {
  type = string
}