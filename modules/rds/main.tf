resource "aws_db_instance" "database_instance" {
  instance_class         = var.db_instance_class
  skip_final_snapshot    = false
  availability_zone      = "us-west-2a"
  identifier             = var.db_instance_name
  snapshot_identifier    = var.db_snapshot_id
  db_subnet_group_name   = var.db_subnet_group_name
  multi_az               = false
  vpc_security_group_ids = var.vpc_security_group
}