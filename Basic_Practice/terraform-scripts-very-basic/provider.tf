

provider "aws" {
   region = "us-west-2"
}

resource "aws_vpc" "logic_vpc" {
   cidr_block       = "10.0.0.0/16"
   instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.logic_vpc.id}"   ===> # To get VPC id resource_name.logic-name.id 
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet1"
  }
}

