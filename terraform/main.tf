terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.15.1"
    }
  }
}

# Configure the Vultr Provider
provider "vultr" {
  api_key = var.vultr_api_key
  rate_limit = 100
  retry_limit = 3
}

resource "vultr_instance" "testlab" {
  plan = var.vultr_server
  region = var.vultr_region
  os_id = var.vultr_osid
  hostname = var.vultr_hostname
  label = var.vultr_label
  backups = "disabled"
  ssh_key_ids = [vultr_ssh_key.main_ssh_key.id]
  enable_ipv6 = true
  user_data = "${file("cloud-init/cloud-config.yaml")}"

  reserved_ip_id = data.vultr_reserved_ip.testlab.id
}

data "vultr_reserved_ip" "testlab" {
  filter {
    name = "label"
    values = [var.vultr_ip_label]
  }
}

resource "vultr_ssh_key" "main_ssh_key" {
  name = "main_ssh_key"
  ssh_key = var.vultr_ssh_key
}
