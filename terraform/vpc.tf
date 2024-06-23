resource "vultr_vpc" "testlab" {
    description = "testbed VPC (Private Network)"
    region = var.vultr_region 
    v4_subnet = "192.168.0.0"
    v4_subnet_mask = "24"
}
