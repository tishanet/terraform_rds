data "aws_vpc" "selected" {
  filter {
    name   = "cidr"
    values = [var.vpc_zdh_cidr]
  }
}

data "aws_subnet" "selected" {
  filter {
    name   = "cidr"
    values = [var.subnet_cidr]
  }
}