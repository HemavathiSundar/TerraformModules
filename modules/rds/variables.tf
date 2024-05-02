variable "subnet_ids" {}

variable "db_instance_class" {}

variable "db_instance_name" {}

variable "db_snapshot_id" {}

variable "db_subnet_group_name" {}

variable "vpc_security_group" {
  type    = set(string)
  default = []
}