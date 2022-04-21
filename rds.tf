resource "aws_db_subnet_group" "db_group_zdh" {
  name       = "db_group_zdh"
  subnet_ids = [data.aws_subnet.selected.id, data.aws_subnet.selected_cidr2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = var.instance_db_name

  create_db_option_group    = false
  create_db_parameter_group = false
  create_random_password    = false
  storage_encrypted         = false

  engine               = var.engine_db
  engine_version       = var.version_db
  instance_class       = var.instance_calss_db
  allocated_storage    = 10
  db_subnet_group_name = aws_db_subnet_group.db_group_zdh.name

  #subnet_ids = [data.aws_subnet.selected.id]

  db_name  = "zdh_db"
  username = "admin_zdh"
  password = "9Ie1dPXa"
  port     = "3306"

  #iam_database_authentication_enabled = true

  vpc_security_group_ids = [data.aws_security_group.selected.id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  tags = {
    Owner       = "zdh"
    Environment = "dev"
  }

  # DB subnet group
  #create_db_subnet_group = true
  #subnet_ids             = ["subnet-12345678", "subnet-87654321"]

  # DB parameter group
  family = var.family_db

  # DB option group
  major_engine_version = "8.0"

  # Database Deletion Protection
  deletion_protection = false

}