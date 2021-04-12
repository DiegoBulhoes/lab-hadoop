variable "region" {
  type = string
}

variable "ip_cidr_range_public" {
  type    = string
  default = "10.10.0.0/24"
}

variable "firewall_ingress_port_UDP" {
  type = list
}

variable "firewall_ingress_port_TCP" {
  type = list
}

