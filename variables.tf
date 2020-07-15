
#Load Balance name. Will be part of the Load Balance FQDN - DNS entry
variable "lbaas-name" {
  default = "appname"
}

variable "lbaas-notes" {
  default = "Load Balance Description - Private-Private"
}

#Types are: "round_robin", "weighted_round_robin", "least_connection"
variable "lb_method" {
  default = "round_robin"
}

variable "datacenter" {
  default = "sao01"
}

# To get the TLS / CERTIFICATE ID use the IBM Cloud CLI command >> ibmcloud sl security cert-list
variable "tls-id" {
  default = "270088"
}

# Types are: PUBLIC or PRIVATE
variable "lbaas-type" {
  default = "PRIVATE"
}

# To get the SUBNET ID use the IBM Cloud CLI command >> ibmcloud sl subnet list >> NEED TO BE A PRIMARY SUBNET <<
variable "lbaas-subnet" {
  default = "1850273"
}

# Numbers of Load Balance Members / IPs
variable "lbaas-member-count" {
  type = string
  default = "2"
}

variable "lbass-member-ips" {
    type    = list
    default = ["10.151.35.202", "10.151.35.203", "10.151.35.204"]
}