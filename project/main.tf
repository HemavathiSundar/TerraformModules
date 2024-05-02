provider "aws" {
  region  = var.region
}

# create vpc
module "vpc" {
  source                       = "../modules/vpc"
  region                       = var.region
  project_name                 = var.project_name
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
}


# create acm
module "acm" {
  source           = "../modules/acm"
  domain_name      = var.domain_name
  alternative_name = var.alternative_name
}

#sg
module "sg" {
  source = "../modules/sg"
  vpc_id = module.vpc.vpc_id
}


#ecr
module "ecr" {
  source = "../modules/ecr"
  name   = var.ecr_repository_name
}

#rds
module "rds" {
  source = "../modules/rds"

  // Pass required variables to the module
  subnet_ids           = var.subnet_ids
  db_instance_class    = var.db_instance_class
  db_instance_name     = var.db_instance_name
  db_snapshot_id       = var.db_snapshot_id
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group   = var.vpc_security_group
}

#s3_cloudfront
module "s3_cloudfront" {
  source              = "../modules/s3_cloudfront"
  bucket_name         = var.bucket_name
  tags                = var.tags
}

#alb
module "application_load_balancer" {
  source = "../modules/alb"
  project_name = module.vpc.project_name
  alb_security_group_id = module.sg.alb_security_group_id
  public_subnet_az1_id = module.vpc.public_subnet_az1_id
  public_subnet_az2_id = module.vpc.public_subnet_az2_id
  vpc_id = module.vpc.vpc_id
  certificate_arn = module.acm.certificate_arn
}


# Include Route 53 module
module "route53" {
  source = "../modules/route53"
  domain_name = var.domain_name
}

#ecs
#module "ecs_module" {
 # source               = "../modules/ecs"
  #task_definition_name = var.ecs_task_definition_name
  #container_name       = var.ecs_container_name
  #target_group_name    = var.target_group_name
  #vpc_id               = module.vpc.vpc_id
#}
