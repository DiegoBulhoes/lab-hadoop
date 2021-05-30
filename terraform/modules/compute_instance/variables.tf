variable "user_name" {
  type        = string
  default     = "gce"
  description = "Name user machine"
}

variable "machine_type" {
  type        = string
  default     = "e2-medium"
  description = "Machine type the cluster"
}

variable "count_worker" {
  type        = number
  default     = 2
  description = "Number of machine workers"
}

variable "count_manager" {
  type        = number
  default     = 1
  description = "Number of machine manger"
}

variable "subnetwork" {
  type        = string
  default     = "subnetwork"
  description = "Name subnetwork"
}

variable "key_ssh" {
  type        = string
  description = "Attribute name that will manage the ssh key"
}
