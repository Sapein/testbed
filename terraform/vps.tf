# Configure the Vultr Provider
provider "vultr" {
  api_key = var.vultr_api_key
  rate_limit = 100
  retry_limit = 3
}

resource "vultr_instance" "testlab" {
  plan = var.vultr_server
  tags = ["terraform", "auto", "managed"]
  region = var.vultr_region
  os_id = var.vultr_osid
  hostname = var.vultr_hostname
  label = var.vultr_label
  backups = "disabled"
  ssh_key_ids = [vultr_ssh_key.main_ssh_key.id]
  enable_ipv6 = true
  user_data = "${templatefile("cloud-init/cloud-config.yaml", { cgit_server_rc = filebase64("cloud-init/lighttpd.conf"), cgit_rc = filebase64("cloud-init/cgitrc"), v4_subnet="${resource.vultr_vpc.testlab.v4_subnet}/${resource.vultr_vpc.testlab.v4_subnet_mask}", compose_file = filebase64("cloud-init/docker-compose.yaml"), service_file = filebase64("cloud-init/testlab.service")})}"
  vpc_ids = [resource.vultr_vpc.testlab.id]
  reserved_ip_id = data.vultr_reserved_ip.testlab.id
}

resource "vultr_instance" "testlab-ci" {
  plan = var.vultr_servers[0]
  tags = ["terraform", "auto", "managed"]
  region = var.vultr_region
  os_id = var.vultr_osid
  hostname = "${var.vultr_hostname}-ci"
  label = "${var.vultr_label}-ci"
  backups = "disabled"
  ssh_key_ids = [vultr_ssh_key.main_ssh_key.id]
  enable_ipv6 = true
  user_data = "${templatefile("cloud-init/ci/cloud-config.yaml", { v4_subnet="${resource.vultr_vpc.testlab.v4_subnet}/${resource.vultr_vpc.testlab.v4_subnet_mask}", compose_file = base64encode(replace(file("cloud-init/ci/docker-compose.yaml"), "TC_IP", resource.vultr_instance.testlab.internal_ip)), service_file = filebase64("cloud-init/ci/jetbrains.service")})}"
  vpc_ids = [resource.vultr_vpc.testlab.id]
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
