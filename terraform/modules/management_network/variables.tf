variable "region" {
  type = string
}

variable "ip_cidr_range_public" {
  type    = string
  default = "10.10.0.0/24"
}

variable "range_IP_access_cluster" {
  type    = list(string)
  default = ["0.0.0.0/0"]
  description = "Range of IP that can access the cluster"
}

variable "list_TCP_ports_internal_cluster" {
  type = list(any)
  description = "list TCP ports internal cluster"
}

variable "list_UDP_ports_internal_cluster" {
  type = list(any)
  description = "list UDP ports internal cluster"
}


variable "list_TCP_ports_external_cluster" {
  type = list(any)
  description = "list TCP ports external cluster"
}

variable "list_UDP_ports_external_cluster" {
  type = list(any)
  description = "list UDP ports external cluster"
}

