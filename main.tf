# Configure the IBM Cloud Provider

resource "ibm_lbaas" "lbaas" {
  name        = var.name
  description = "lbaas example"
  type        = "public"
  subnets     = [var.subnet_id]

  protocols {
    frontend_protocol     = "HTTP"
    frontend_port         = 80
    backend_protocol      = "HTTP"
    backend_port          = 80
    load_balancing_method = var.lb_method
#    tls_certificate_id    = ibm_compute_ssl_certificate.lbaas-ssl-certificate2.id
}

resource "ibm_lbaas_server_instance_attachment" "lbaas_member" {
  count              = 1
  private_ip_address = "75.126.255.2"
  weight             = 40
  lbaas_id           = "${ibm_lbaas.lbaas.id}"
  depends_on         = ["ibm_lbaas.lbaas.id"]
}

resource "ibm_lbaas_health_monitor" "lbaas_hm" {
  protocol   = ibm_lbaas.lbaas.health_monitors[0].protocol
  port       = ibm_lbaas.lbaas.health_monitors[0].port
  timeout    = 3
  lbaas_id   = ibm_lbaas.lbaas.id
  monitor_id = ibm_lbaas.lbaas.health_monitors[0].monitor_id
}

