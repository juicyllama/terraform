variable "prefix" {
  default = "juicyllama"
}

variable "vpc_cidr" {
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "Must be a valid IPv4 CIDR block address."
  }
}

variable "region" {
  type = string
}

variable "create_vpc" {
  default = false
}

variable "public_subnets_cidrs" {
  default = []
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "subnet_ids" {
  type    = list(string)
  default = []
}

variable "mysql_security_group_id" {
  default = ""
}

variable "redis_security_group_id" {
  default = ""
}

variable "create_ci_cd" {
  default = false
}

variable "npm_token" {
  default = ""
}

variable "ci_cd_service_role" {
  default = ""
}

variable "codepipeline_expected_bucket_owner" {
  default = ""
}

variable "github_repo_id" {
  default = "juicyllama/juicyllama-api"
}

variable "codepipeline_tags" {
  type    = map(string)
  default = {}
}

variable "codebuild_tags" {
  type    = map(string)
  default = {}
}

variable "codepipeline_role_arn" {
  default = ""
}

variable "create_lightsail" {
  default = false
}

variable "static_ip_name" {
  default = ""
}

variable "lightsail_tags" {
  type    = map(string)
  default = {}
}

variable "domain_name" {
  default = "juicyllama.com"
}

variable "cdn_domain_name" {
  default = "cdn.juicyllama.com"
}

variable "lightsail_instance_prefix" {
  default = "Juicyllama"
}

variable "elasticache_snapshot_retention_limit" {
  default = 0
}

variable "eb_ami_id" {
  default = ""
}

variable "mysql_username" {
  default = "admin"
}

variable "mysql_password" {
  default = "password"
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

variable "lightsail_domain_name" {
  default = ""
}

variable "lightsail_lb_name" {
  default = "juicyllama-lb"
}

variable "lightsail_lb_cert_name" {
  default = "juicyllama-ssl"
}
variable "create_lightsail_key_pair" {
  default = false
}
variable "lightsail_zone_id" {
  default = ""
}
variable "lightsail_subject_alternative_names" {
  default = []
}

variable "codestar_connection_name" {
  default = "JUICYLLAMA"
}

variable "codebuild_cloudwatch_logs_group_name" {
  default = "JUICYLLAMA_CI"
}

variable "backends" {
  description = "Backend configuration"
  type        = any
}
variable "frontends" {
  description = "Frontend configuration"
  type = list(object({
    domain_name      = string
    repository       = string
    name             = string
    framework        = string
    prefix           = string
    github_pat_token = string
    env_vars         = any
    custom_rules     = any
  }))
  default = []
}

variable "codepipelines" {
  description = "A list of configurations for AWS CodePipelines."
  type = list(object({
    codepipeline_bucket                   = string
    codebuild_project_name                = string
    codepipeline_project_name             = string
    codepipeline_detect_changes           = bool
    codebuild_cloudwatch_logs_stream_name = string
    codebuild_buildspec_path              = string
    codepipeline_stages = list(object({
      name = string
      actions = list(object({
        name            = string
        category        = string
        owner           = string
        provider        = string
        region          = string
        input_artifacts = list(string)
        version         = string
        namespace       = optional(string)
        run_order       = optional(number)
        configuration   = map(string)
      }))
    }))
  }))
  default = []
}

variable "buckets" {
  description = "A list of configurations for AWS S3 buckets."
  default = []
  type = list(object({
    name    = string
    private = bool
  }))
}

variable "doppler_external_id" {
  default = ""
}

variable "doppler_policy_name" {
  default = "Doppler"
}

variable "connect_to_mongodb" {
  default = false
}

variable "mongodb_atlas_project_id" {
  default = "643a4b67e08d3351ea3a5054"
}
