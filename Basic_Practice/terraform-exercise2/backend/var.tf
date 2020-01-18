variable "region" {}

variable "ami" {}

variable "key-name" {
  default = "all_servers"
}

variable "pvt_key" {
  default = "/opt/terraform-exercise2/frontend/all_servers.pem"
}

variable "public" {
   default = "/root/.ssh/id_rsa.pub"
}

variable "private" {
   default = "/root/.ssh/id_rsa"
}

