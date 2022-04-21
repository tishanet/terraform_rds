data "aws_security_group" "selected" {
  #id = var.sg_bastion_id
  filter {
    name   = "group-name"
    values = ["bastion_sg*"]
  }
}