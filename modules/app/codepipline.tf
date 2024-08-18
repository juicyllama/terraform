module "codepipeline" {
  count  = length(var.codepipelines)
  source = "../codepipelines"
  prefix = var.prefix
  region = var.region

  # Code Pipeline/Commit/Build/Deploy
  create_ci_cd                          = var.create_ci_cd
  npm_token                             = var.npm_token
  ci_cd_service_role                    = var.ci_cd_service_role
  codepipeline_bucket                   = lookup(var.codepipelines[count.index], "codepipeline_bucket", "")
  codepipeline_expected_bucket_owner    = var.codepipeline_expected_bucket_owner
  codebuild_tags                        = var.codebuild_tags
  codepipeline_tags                     = var.codepipeline_tags
  codepipeline_role_arn                 = var.codepipeline_role_arn
  codebuild_project_name                = lookup(var.codepipelines[count.index], "codebuild_project_name", "")
  codepipeline_project_name             = lookup(var.codepipelines[count.index], "codepipeline_project_name", "")
  codepipeline_detect_changes           = lookup(var.codepipelines[count.index], "codepipeline_detect_changes", false)
  codebuild_cloudwatch_logs_group_name  = var.codebuild_cloudwatch_logs_group_name
  codebuild_cloudwatch_logs_stream_name = lookup(var.codepipelines[count.index], "codebuild_cloudwatch_logs_stream_name", "")
  github_repo_id                        = var.github_repo_id
  codepipeline_stages                   = lookup(var.codepipelines[count.index], "codepipeline_stages", [])
  codebuild_buildspec_path              = lookup(var.codepipelines[count.index], "codebuild_buildspec_path", "")
  codestar_connection_arn               = length(aws_codestarconnections_connection.github) > 0 ? aws_codestarconnections_connection.github[0].arn : ""
}
