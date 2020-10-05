variable "zone" {
  type = string
}

variable "region" {
  type = string
}

variable "user_name" {
  type = string
}

variable "project" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "count_worker" {
  type = number
}

variable "count_manager" {
  type = number
}

variable "subnet" {
  type = string
}

variable "ip_cidr_range_public" {
  type = string
}

variable "key_ssh" {
  type = string
}

variable "firewall_ingress_port_UDP" {
  type = list
}

variable "firewall_ingress_port_TCP" {
  type = list
}