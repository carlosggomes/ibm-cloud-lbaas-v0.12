variable "iaas_classic_username" {}
variable "iaas_classic_api_key" {}
variable "ibmcloud_api_key" {}

provider "ibm" {
  generation            = 1
  region                = "us-south"
  ibmcloud_api_key      = "var.ibmcloud_api_key"
  iaas_classic_username = "var.iaas_classic_username"
  iaas_classic_api_key  = "var.iaas_classic_api_key"
}
