#Common
name_bastion_rds = "bastion_rds"
ami_bastion_rds  = "ami-04505e74c0741db8d"
instance_type    = "t2.micro"
# Network
subnet_cidr  = "10.10.10.0/24"
subnet_cidr2 = "10.10.40.0/24"
vpc_zdh_cidr = "10.10.0.0/16"

#db
instance_db_name  = "dbzdh"
engine_db         = "mysql"
version_db        = "8.0.20"
instance_calss_db = "db.t2.micro"
family_db         = "mysql8.0"
