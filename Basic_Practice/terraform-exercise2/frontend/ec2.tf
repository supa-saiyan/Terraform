provider "aws" {
  region = "${var.region}"
}

data "aws_availability_zones" "azs" {}

resource "aws_security_group" "examplesg" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "pair" {
  key_name   = "fkey"
  public_key = "${file(var.public)}"}

resource "aws_instance" "frontend" {
  count                  = "1"
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  availability_zone      = "${data.aws_availability_zones.azs.names[count.index]}"
  key_name               = "${aws_key_pair.pair.key_name}"
  vpc_security_group_ids = ["${aws_security_group.examplesg.id}"]

  provisioner "file" {
    source      = "/opt/terraform-exercise2/frontend/script.sh"
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
