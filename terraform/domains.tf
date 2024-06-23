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
  record {
    hostname = "hub.testlab"
    type = "A"
    ttl = "60"
    address = vultr_instance.testlab.main_ip
  }

  record {
    hostname = "hub.testlab"
    type = "AAAA"
    ttl = "60"
    address = vultr_instance.testlab.v6_main_ip
  }
  record {
    hostname = "youtrack.testlab"
    type = "A"
    ttl = "60"
    address = vultr_instance.testlab.main_ip
  }

  record {
    hostname = "youtrack.testlab"
    type = "AAAA"
    ttl = "60"
    address = vultr_instance.testlab.v6_main_ip
  }
  record {
    hostname = "teamcity.testlab"
    type = "A"
    ttl = "60"
    address = vultr_instance.testlab.main_ip
  }

  record {
    hostname = "teamcity.testlab"
    type = "AAAA"
    ttl = "60"
    address = vultr_instance.testlab.v6_main_ip
  }

  record {
    hostname = "onedev.testlab"
    type = "A"
    ttl = "60"
    address = vultr_instance.testlab.main_ip
  }

  record {
    hostname = "onedev.testlab"
    type = "AAAA"
    ttl = "60"
    address = vultr_instance.testlab.v6_main_ip
  }

  record {
    hostname = "lldap.testlab"
    type = "A"
    ttl = "60"
    address = vultr_instance.testlab.main_ip
  }

  record {
    hostname = "lldap.testlab"
    type = "AAAA"
    ttl = "60"
    address = vultr_instance.testlab.v6_main_ip
  }


  record {
    hostname = "cgit.testlab"
    type = "A"
    ttl = "60"
    address = vultr_instance.testlab.main_ip
  }

  record {
    hostname = "cgit.testlab"
    type = "AAAA"
    ttl = "60"
    address = vultr_instance.testlab.v6_main_ip
  }
}
