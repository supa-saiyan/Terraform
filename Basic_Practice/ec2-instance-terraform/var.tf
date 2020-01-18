
variable "pem" {
   default = "/opt/ec2-instance-terraform/us-east-1.pem"
}

variable "public" {
   default = "/root/.ssh/id_rsa.pub"
}

variable "private" {
   default = "/root/.ssh/id_rsa"
}

