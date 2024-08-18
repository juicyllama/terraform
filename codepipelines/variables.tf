variable "prefix" {
  default = "juicyllama"
}

variable "region" {
  type = string
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

variable "codepipeline_bucket" {
  default = ""
}

variable "github_repo_id" {
  default = "juicyllama/juicyllama-api"
}

variable "codepipeline_expected_bucket_owner" {
  default = ""
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

variable "codebuild_project_name" {
  default = "JUICYLLAMA_CI_BUILD"
}

variable "codebuild_buildspec_path" {
  default = "buildspec.yml"
}

variable "codepipeline_project_name" {
  default = "JUICYLLAMA_CI"
}

variable "codepipeline_detect_changes" {
  default = false
}

variable "codebuild_cloudwatch_logs_group_name" {
  default = "JUICYLLAMA_CI"
}

variable "codebuild_cloudwatch_logs_stream_name" {
  default = "BUILD"
}

variable "codepipeline_stages" {
  description = "Stages for the pipeline"
  type = list(object({
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
      configuration   = map(string)
    }))
  }))
  default = []
}

variable "codestar_connection_arn" {
  type = string
}
