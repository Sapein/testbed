terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.21.0"
    }
    namecheap = {
      source = "namecheap/namecheap"
      version = "2.1.2"
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
  user_data = "${templatefile("cloud-init/cloud-config.yaml", { compose_file = filebase64("cloud-init/docker-compose.yaml"), service_file = filebase64("cloud-init/jetbrains.service")})}"
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

# Configure the Namecheap Provider
provider "namecheap" {
  user_name = var.namecheap_username
  api_user = var.namecheap_username
  api_key = var.namecheap_api_key
}

resource "namecheap_domain_records" "primary-xyz" {
  domain = var.namecheap_main_domain
  mode = "MERGE"

  record {
    hostname = "testlab"
    type = "A"
    ttl = "60"
    address = vultr_instance.testlab.main_ip
  }

  record {
    hostname = "testlab"
    type = "AAAA"
    ttl = "60"
    address = vultr_instance.testlab.v6_main_ip
  }
}
