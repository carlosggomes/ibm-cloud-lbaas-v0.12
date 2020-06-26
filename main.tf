resource "ibm_lbaas" "lbaas" {
  name        = "lbaas-cguarany3"
  description = "created-by-schematics"
  type        = "PRIVATE"
  subnets     = [2088037]

  protocols {
    frontend_protocol     = "HTTP"
    frontend_port         = 80
    backend_protocol      = "HTTP"
    backend_port          = 80
    load_balancing_method = "round_robin"
  }
}

resource "ibm_lbaas_server_instance_attachment" "lbaas_member" {
  count              = 1
  private_ip_address = "10.95.118.234"
  weight             = 40
  lbaas_id           = ibm_lbaas.lbaas.id
}
