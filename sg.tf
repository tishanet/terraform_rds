# find our existing security group
data "aws_security_group" "selected" {
  #id = var.sg_bastion_id
  filter {
    name   = "group-name"
    values = ["bastion_sg*"]
  }
}

#use a resours we added the new rule for ingress to MySQL 
resource "aws_security_group_rule" "mysql" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [var.subnet_cidr, var.subnet_cidr2]
  security_group_id = data.aws_security_group.selected.id
}