
provider "aws" {
    region = "us-west-1"
}

provider "aws" {
    region = "us-west-2"
    alias  = "us-west-2"
}

resource "aws_instance" "frontend-west2" {
     count = 2
     ami           = "ami-036affea69a1101c9"
     instance_type = "t2.micro"
     provider      =  "aws.us-west-2"
     depends_on    =  ["aws_instance.backend-west2"]
     tags = {
       Name = "Front-west2"
  }
}

resource "aws_instance" "frontend-west1" {
     count = 2
     ami           = "ami-0ec1ad91f200c15a8"
     instance_type = "t2.micro"
     depends_on    = ["aws_instance.backend-west2"]
     tags = {
       Name = "Front-west1"
  }
}


resource "aws_instance" "backend-west2" {
     count = 2
     ami           = "ami-036affea69a1101c9"
     instance_type = "t2.micro"
     provider      =  "aws.us-west-2"
     tags = {
       Name = "Back-west2"
  }
}

resource "aws_instance" "backend-west1" {
     count = 2
     ami           = "ami-0ec1ad91f200c15a8"
     instance_type = "t2.micro"

     tags = {
       Name = "Back-west1"
  }
}


