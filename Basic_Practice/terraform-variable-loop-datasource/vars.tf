variable "region" {
  default = "us-west-2"
}

variable "block" {
  default = "10.0.0.0/16"
}

variable "subnet" {
  type    = "list"
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
}

#variable "azs" {
#  type    = "list"
#  default = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
#}

data "aws_availability_zones" "azs" {} # It is data source 
