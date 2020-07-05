resource "ibm_lbaas" "lbaas" {
  name        = var.lbaas-name
  description = var.lbaas-notes
  type        = var.lbaas-type
  subnets     = var.lbaas-subnet

  protocols {
    frontend_protocol     = "HTTPS"
    frontend_port         = 443
    backend_protocol      = "HTTP"
    backend_port          = 80
    load_balancing_method = var.lb_method
    tls_certificate_id    = var.tls-id
  }
}

resource "ibm_lbaas_server_instance_attachment" "lbaas_member" {
  count              = 2
  private_ip_address = element(["10.151.35.202", "10.151.35.203", "10.151.35.204"], count.index)
  weight             = 40
  lbaas_id           = ibm_lbaas.lbaas.id  
  }
