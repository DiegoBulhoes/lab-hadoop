variable "zone" {
  type = string
}

variable "region" {
  type = string
}

variable "project" {
  type = string
}

variable "ip_cidr_range_public" {
  type = string
}

variable "firewall_ingress_port_UDP" {
  type = list
}

variable "firewall_ingress_port_TCP" {
  type = list
}

