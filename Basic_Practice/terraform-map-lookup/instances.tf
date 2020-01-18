resource "aws_instance" "server" {
  ami           = "${lookup(var.ami,var.region)}"
  instance_type = "t2.micro"
  tags { 
    Name  =  "Deployed from terraform"
}
}
