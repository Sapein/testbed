variable "vultr_api_key" {
  description = "API Key for Vultr"
  type = string
  sensitive = true
}

variable "vultr_ssh_key" {
  description = "SSH Key for a vultur server"
  type = string
  sensitive = true
}

variable "vultr_ip_label" {
  description = "Reserved IP Label for a vultr server"
  type = string
  sensitive = true
}

variable "vultr_ip_id" {
  description = "Reserved IP ID for a vultr server"
  type = string
  sensitive = true
}

variable "namecheap_username" {
  description = "Username for NameCheap"
  type = string
  sensitive = true
}

variable "namecheap_api_key" {
  description = "API Key for NameCheap"
  type = string
  sensitive = true
}

variable "namecheap_main_domain" {
  description = "Primary URL with Namecheap"
  type = string
  sensitive = true
}


variable "namecheap_test_domains" {
  description = "Testing Domains for Namecheap"
  type = list
  sensitive = true
}

