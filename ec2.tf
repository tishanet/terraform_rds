module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = var.name_bastion_rds

  ami           = var.ami_bastion_rds
  instance_type = var.instance_type
  key_name      = data.aws_key_pair.bastion.key_name
  monitoring    = false

  root_block_device = [
    {
      volume_size = 8
  }]
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  subnet_id              = data.aws_subnet.selected.id
}