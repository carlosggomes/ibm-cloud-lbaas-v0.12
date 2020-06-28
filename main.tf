variable "lbaas_member_ip_1" {}
variable "lbaas_member_ip_2" {}

resource "ibm_lbaas" "lbaas" {
  name        = "lbaas-cguarany4"
  description = "created-by-schematics - IP Private Portable"
  type        = "PRIVATE"
  subnets     = [1850273]

  protocols {
    frontend_protocol     = "HTTPS"
    frontend_port         = 443
    backend_protocol      = "HTTP"
    backend_port          = 80
    load_balancing_method = "round_robin"
    tls_certificate_id    = 270088
  }
}

resource "ibm_lbaas_server_instance_attachment" "lbaas_member" {
  count              = 2
  private_ip_address = var.lbaas_member_ip_*
  weight             = 40
  lbaas_id           = ibm_lbaas.lbaas.id  
  }
