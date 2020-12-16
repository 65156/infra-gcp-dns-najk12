
variable "environment" {
  type = string
}
variable "dns_public_zone_name" {
  type = string
}
variable "dns_public_zone" {
  type = string
}
variable "dns_private_zone_name" {
  type = string
}
variable "dns_private_zone" {
  type = string
}
variable "project" {
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
  type    = string
  default = null
}
variable "dns_description" {
  type = string
}