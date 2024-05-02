variable "region"{}
variable "project_name"{}
variable "vpc_cidr"{}
variable "public_subnet_az1_cidr"{}
variable "public_subnet_az2_cidr"{}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "private_data_subnet_az1_cidr" {}
variable "private_data_subnet_az2_cidr" {}
variable "domain_name" {
  description = "The domain name for Route53 DNS zone"
  type        = string
}
variable "alternative_name" {}
variable "ecr_repository_name" {}

variable "subnet_ids" {}

variable "db_instance_class" {}

variable "db_instance_name" {}

variable "db_snapshot_id" {}

variable "db_subnet_group_name" {}

variable "vpc_security_group" {}

variable "route53_project_name" {
  type    = string
  default = "my-project"
}

variable "route53_domain_name" {
  type    = string
  default = "example.com"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}


variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
variable "ecs_task_definition_name" {
  description = "Name of the ECS task definition"
  type        = string
}

variable "ecs_container_name" {
  description = "Name of the container within the task definition"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}