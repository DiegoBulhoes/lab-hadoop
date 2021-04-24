variable "region" {
  type = string
}

variable "ip_cidr_range_public" {
  type    = string
  default = "10.10.0.0/24"
}

variable "source_ranges" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "firewall_ingress_port_UDP" {
  type = list(any)
}

variable "firewall_ingress_port_TCP" {
  type = list(any)
}

