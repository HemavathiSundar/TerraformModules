region = "us-east-1"
project_name = "creating vpc"
vpc_cidr = "10.0.0.0/16"
public_subnet_az1_cidr = "10.0.0.0/24"
public_subnet_az2_cidr = "10.0.1.0/24"
private_app_subnet_az1_cidr = "10.0.2.0/24"
private_app_subnet_az2_cidr = "10.0.3.0/24"
private_data_subnet_az1_cidr = "10.0.4.0/24"
private_data_subnet_az2_cidr = "10.0.5.0/24"
domain_name = "ishahema.com"
alternative_name = "*ishahema.com"
ecr_repository_name = "my-ecr-repo"

subnet_ids = "subnet-0607c15fbb971d0e4"
db_instance_class = "db.t2.micro"
db_instance_name = "my-rds-instance"
db_snapshot_id = "your-db-snapshot-id"
db_subnet_group_name = "my-db-subnet-group"
vpc_security_group = ["sg-0b7126b5957eb7e53"]




bucket_name = "jeevihema13bucket"
tags = {
  Environment = "staging"
  Project = "example-project"
}
ecs_task_definition_name = "my-ecs-task-definition"
ecs_container_name       = "my-container"
target_group_name        = "my-target-group"