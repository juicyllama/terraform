locals {
  codepipeline_role_arn = var.codepipeline_role_arn != "" ? var.codepipeline_role_arn : aws_iam_role.aws_codepipeline_role[0].arn
  codebuild_role_arn    = var.ci_cd_service_role != "" ? var.ci_cd_service_role : aws_iam_role.aws_codebuild_role[0].arn
}
