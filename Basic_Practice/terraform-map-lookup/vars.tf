variable "region" {
  default = "us-west-2"
}

variable "ami" {
  type = "map"

  default = {
    us-west-1 = "ami-0ec1ad91f200c15a8"
    us-west-2 = "ami-036affea69a1101c9"
  }
}
