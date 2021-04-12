variable "user_name" {
  type    = string
  default = "gce"
}

variable "machine_type" {
  type    = string
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

variable "subnetwork" {
  type = string
  default = "subnetwork"
}

variable "key_ssh" {
  type = string
}
