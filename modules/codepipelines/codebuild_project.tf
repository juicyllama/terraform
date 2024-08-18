data "aws_kms_alias" "s3" {
  name = "alias/aws/s3"
}

resource "aws_codebuild_project" "ci_cd_project" {
  count          = var.create_ci_cd ? 1 : 0
  name           = var.codebuild_project_name
  build_timeout  = "60"
  queued_timeout = "480"
  encryption_key = data.aws_kms_alias.s3.arn
  service_role   = local.codebuild_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }

  cache {
    type = "NO_CACHE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "NPM_TOKEN"
      value = var.npm_token
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = var.codebuild_buildspec_path
  }

  logs_config {
    cloudwatch_logs {
      group_name  = var.codebuild_cloudwatch_logs_group_name
      stream_name = var.codebuild_cloudwatch_logs_stream_name
      status      = "ENABLED"
    }
  }

  tags = var.codebuild_tags
}
