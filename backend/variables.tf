variable "create_elasticache" {
  default = false
}

variable "elasticache_cluster_name" {
  type    = string
  default = ""
}

variable "elasticache_node_type" {
  type    = string
  default = "cache.t3.micro"
}

variable "elasticache_subnet_ids" {
  type    = list(string)
  default = []
}

variable "elasticache_tags" {
  type    = map(string)
  default = {}
}

variable "create_elastic_beanstalk" {
  default = false
}

variable "create_ec2_tunnel" {
  default = false
}

variable "tunnel_subnet_id" {
  default = ""
}

variable "tunnel_instance_tags" {
  type    = map(string)
  default = {}
}

variable "create_mysql" {
  default = false
}

variable "mysql_cluster_name" {
  default = "juicyllama"
  type    = string
}

variable "mysql_instance_name" {
  default = "shared-instance-1"
  type    = string
}

variable "mysql_vpc_id" {
  type    = string
  default = ""
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "mysql_subnet_group_name" {
  default = "default"
}

variable "mysql_min_capacity" {
  default = 1
}

variable "mysql_max_capacity" {
  default = 2
}

variable "mysql_tags" {
  type    = map(string)
  default = {}
}

variable "mysql_security_group_ids" {
  default = []
  type    = list(string)
}

variable "redis_security_group_ids" {
  default = []
  type    = list(string)
}

# variable "acm_cert_arn" {
#   type    = string
#   default = ""
# }



variable "tunnel_sg_description" {
  default = ""
}

variable "elasticache_snapshot_retention_limit" {
  default = 0
}

variable "tunnel_ami" {
  default = "ami-08cd358d745620807"
}

variable "tunnel_type" {
  default = "t4g.nano"
}

variable "eb_stack_name" {
  default = "64bit Amazon Linux 2023 v6.1.6 running Node.js 20"
}
variable "key_pair_name" {
  default = "ssh-key"
}

variable "eb_ami_id" {
  default = ""
}

variable "eb_subnet_ids" {
  type    = list(string)
  default = []
}

variable "lb_subnet_ids" {
  type    = list(string)
  default = []
}

variable "mysql_username" {
  default = "admin"
}


variable "mysql_preferred_maintenance_window" {
  default = "thu:00:31-thu:01:01"
}

variable "mysql_preferred_backup_window" {
  default = "03:02-03:32"
}

variable "mysql_backup_retention_period" {
  default = 1
}

variable "eb_env_name" {
  default = "API-ENV"
}

variable "eb_app_name" {
  default = "API"
}

variable "doppler_secrets" {
  type = list(string)
}

variable "create_eb_iam_profile" {
  default = false
}

variable "eb_env_vars" {
  type = map(string)
}

variable "domain" {
  type = string
}
variable "zone_id" {
  type = string
}
variable "eb_instance_type" {
  type = string
}

variable "eb_max_size" {
  type = number
}