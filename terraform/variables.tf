variable "zone" {
  type        = string
  default     = "us-central1-a"
  description = "Zone in which resources will be implemented"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "Region in which resources will be implemented"
}
variable "project" {
  type        = string
  description = "Id project"
}

variable "user_name" {
  type        = string
  default     = "gce"
  description = "Instance user name"
}
variable "machine_type" {
  type        = string
  default     = "e2-medium"
  description = "Type of the instance that will be created"
}

variable "count_worker" {
  type        = number
  default     = 2
  description = "Quantity of worker"
}

variable "count_manager" {
  type        = number
  default     = 1
  description = "Quantity of manager"
}

variable "subnet" {
  type        = string
  default     = "hadoop-subnetwork"
  description = "Subnet that will be created for the cluster"
}

variable "ip_cidr_range_public" {
  type        = string
  default     = "10.10.0.0/24"
  description = "CIDR - subnet cluster"
}

variable "key_ssh" {
  type        = string
  description = "SSH public key file path"
}

variable "firewall_ingress_port_UDP" {
  type        = list(string)
  description = "Set of ports that will be released on the firewall"
}

variable "firewall_ingress_port_TCP" {
  type        = list(string)
  description = "Set of ports that will be released on the firewall"
}
variable "source_ranges" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "Source ranges"
}
