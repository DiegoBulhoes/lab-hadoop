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

variable "publ_net_firewall_port_UDP" {
  type = list
}

variable "publ_net_firewall_port_TCP" {
  type = list
}