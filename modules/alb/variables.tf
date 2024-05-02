variable "project_name" {
  type    = string
 # default = "" // or provide a default value if needed
}

variable "alb_security_group_id" {
  type = string
  # Add additional constraints or defaults if needed
}


variable "public_subnet_az1_id" {}
variable "public_subnet_az2_id" {}
variable "vpc_id" {}
variable "certificate_arn" {}