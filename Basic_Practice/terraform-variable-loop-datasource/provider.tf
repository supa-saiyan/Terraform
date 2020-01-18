provider "aws" {
  region = "${var.region}" # {""} this method is called interpollation 
}

resource "aws_vpc" "logic_vpc" {
  cidr_block       = "${var.block}"
  instance_tenancy = "default"

  tags = {
    Name = "Created by using terraform"
  }
}

resource "aws_subnet" "subnet" {
  # count      = "${length(var.azs)}"                  # terraform function to find interger from azs variable 

  count             = "${length(data.aws_availability_zones.azs.names)}"              # terraform data source to find availability zones and provide using data
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}" # Hear we set az for subnet 
  vpc_id            = "${aws_vpc.logic_vpc.id}"                                       # To get VPC id resource_name.logic-name.id 
  cidr_block        = "${element(var.subnet, count.index)}"                           # To get subnet value according to count of azs variable  

  tags = {
    Name = "${element(var.subnet,count.index)}"
  }
}
