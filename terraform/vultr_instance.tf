output "vultr_instance_ip" {
  value = [vultr_instance.testlab.main_ip, vultr_instance.testlab.v6_main_ip, vultr_instance.testlab.internal_ip]
}
