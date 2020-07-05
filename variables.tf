

variable "lbaas-name" {
  default = "appname"
}

variable "lbaas-notes" {
  default = "Load Balance Description - Private-Private"
}

variable "lb_method" {
  default = "round_robin"
}

variable "subnet_id" {
  default = "1851345"
}

variable "datacenter" {
  default = "sao01"
}

variable "tls-id" {
  default = "270088"
}

variable "lbaas-type" {
  default = "PRIVATE"
}

variable "lbaas-subnet" {
  default = "1850273"
}