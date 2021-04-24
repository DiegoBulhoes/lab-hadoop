variable "zone" {
  type = string
}

variable "region" {
  type = string
}
variable "project" {
  type = string
}

variable "user_name" {
  type = string
  default = "gce"
}
variable "machine_type" {
  type         = string
  default = "e2-medium"
}

variable "count_worker" {
  type    = number
  default = 2
}

variable "count_manager" {
  type    = number
  default = 1
}

variable "subnet" {
  type    = string
  default = "hadoop-subnetwork"
}

variable "ip_cidr_range_public" {
  type    = string
  default = "10.10.0.0/24"
}

variable "key_ssh" {
  type = string
}

variable "firewall_ingress_port_UDP" {
  type = list(any)
}

variable "firewall_ingress_port_TCP" {
  type = list(any)
variable "source_ranges" {
  type = list(string)
  default = ["0.0.0.0/0"]
  description = "Source ranges"
}
