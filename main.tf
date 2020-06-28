resource "ibm_lbaas" "lbaas" {
  name        = "lbaas-cguarany4"
  description = "created-by-schematics - IP Private Portable"
  type        = "PRIVATE"
  datacenter   = "SAO01"
  subnets     = [1899581]

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
  private_ip_address = "10.151.50.54"
  weight             = 40
  lbaas_id           = ibm_lbaas.lbaas.id
}
