variable "rate_limit" {
  description = "The Rate Limit for provisioning"
  type = number
  default = 100
}

variable "retry_limit" {
  description = "The Retry Limit for provisioning"
  type = number
  default = 3
}

variable "vultr_server" {
  description = "A Vultr Server Instance"
  type = string
  default = "vc2-1c-0.5gb" # Cheapest available vc2 instance in NJ.
}

variable "vultr_region" {
  description = "The Server Region"
  type = string
  default = "ewr" # New Jersey Region
}

variable "vultr_osid" {
  description = "The ID of the OS to use."
  type = string
  default = "477" # 1929 for Fedora
}

variable "vultr_hostname" {
  description = "The hostname of the vultr server"
  type = string
  default = "default-hostname"
}

variable "vultr_label" {
  description = "The hostname of the vultr server"
  type = string
  default = "Cloud Instance"
}

variable "vultr_ip_type" {
  description = "The IP Type of a reserved IP Address."
  type = string
  default = "v4"
}
