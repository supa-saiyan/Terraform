locals {
  regions = {
    stag          = "us-west-1"
    us-west-1-ami = "ami-0019ef04ac50be30f"
    prod          = "us-east-1"
    us-east-1-ami = "ami-0de53d8956e8dcf80"
  }

  count = {
    stag = "1"
    prod = "2"
  }
}

locals {
  ids = "${join("-",list(local.regions[terraform.workspace], "ami"))}"
}

locals {
  sgs = "${join("-",list(local.regions[terraform.workspace], "sg"))}"
}

module "backend" {
  source = "/opt/terraform-exercise2/backend/"
  region = "${local.regions[terraform.workspace]}"
  ami    = "${local.regions[local.ids]}"
}

module "frontend" {
  source = "/opt/terraform-exercise2/frontend/"
  region = "${local.regions[terraform.workspace]}"
  ami    = "${local.regions[local.ids]}"
}
