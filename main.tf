resource "ibm_lbaas" "lbaas" {
  name        = "test"
  description = "updated desc-used for terraform uat"
  subnets     = [2367048]
#  datacenter  = "dal13"

  protocols {
    frontend_protocol     = "HTTP"
    frontend_port         = 80
    backend_protocol      = "HTTP"
    backend_port          = 80
    load_balancing_method = "round_robin"
  }

resource "ibm_lbaas_server_instance_attachment" "lbaas_member" {
  count              = 2
  private_ip_address = "75.126.255.2"
  weight             = 40
  lbaas_id           = "${ibm_lbaas.lbaas.id}"
  depends_on         = ["ibm_lbaas.lbaas.id"]
}

  }
