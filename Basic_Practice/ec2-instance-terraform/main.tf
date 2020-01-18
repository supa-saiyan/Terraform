
provider "aws" {
   region = "us-east-1"
}

#resource "aws_security_group" "examplesg" {
#  ingress {
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  ingress {
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
# 
#  egress {
#    from_port       = 0
#    to_port         = 0
#    protocol        = "-1"
#    cidr_blocks     = ["0.0.0.0/0"]
#  }
#}


resource "aws_key_pair" "pair" {
  key_name   = "key"
  public_key = "${file(var.public)}"}


resource "aws_instance" "webapp" {
   count = 1
   ami = "ami-011b3ccf1bd6db744"
   instance_type = "t2.micro"
#   vpc_security_group_ids = ["${aws_security_group.examplesg.id}"]
   vpc_security_group_ids = ["sg-0f0468550e872a1b3"]
   subnet_id = "subnet-0b6b575f42bd72c86"
   key_name = "${aws_key_pair.pair.key_name}"

   provisioner "file" {
      source = "/opt/ec2-instance-terraform/script.sh"
       destination = "/tmp/script.sh"
   }

   connection {
     user        = "ec2-user"
     type        = "ssh"
     private_key = "${file(var.private)}"
   }

   provisioner "remote-exec" {
     inline = [
       "sudo chmod +x /tmp/script.sh",
       "sudo chown root. /tmp/script.sh",
       "sudo cp /tmp/script.sh /root/",
       "sudo bash -x /root/script.sh",
     ]
   }

}

