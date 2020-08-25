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

variable "ip_cidr_range_private" {
  type = string
}

variable "key_ssh" {
  type = string
}

variable "port_firewall_public" {
  type = list
}

variable "port_firewall_private" {
  type = list
}
