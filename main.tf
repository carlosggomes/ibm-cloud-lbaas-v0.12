resource "ibm_lbaas" "lbaas" {
  name        = "test"
  description = "updated desc-used for terraform uat"
  subnets     = [2367048]
  datacenter  = "dal13"

  protocols {
    frontend_protocol     = "HTTP"
    frontend_port         = 80
    backend_protocol      = "HTTP"
    backend_port          = 80
    load_balancing_method = "round_robin"
  }

  server_instances {
    private_ip_address = "75.126.255.2"
  }
}

data "ibm_lbaas" "tfacc_lbaas" {
  name = "test"
}
