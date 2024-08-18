resource "aws_codepipeline" "codepipeline" {
  count    = var.create_ci_cd ? 1 : 0
  name     = var.codepipeline_project_name
  role_arn = local.codepipeline_role_arn

  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket[count.index].bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      namespace        = "SourceVariables"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["SourceArtifact"]

      configuration = {
        OutputArtifactFormat = "CODE_ZIP"
        ConnectionArn        = var.codestar_connection_arn
        FullRepositoryId     = var.github_repo_id
        BranchName           = "main"
        DetectChanges        = var.codepipeline_detect_changes
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      namespace        = "BuildVariables"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.ci_cd_project[count.index].name
      }
    }
  }

  dynamic "stage" {
    for_each = var.codepipeline_stages
    content {
      name = stage.value.name

      dynamic "action" {
        for_each = stage.value.actions
        content {
          name            = action.value.name
          category        = action.value.category
          owner           = action.value.owner
          provider        = action.value.provider
          region          = action.value.region
          input_artifacts = action.value.input_artifacts
          version         = action.value.version
          namespace       = action.value.namespace

          configuration = {
            for key, value in action.value.configuration : key => value
          }
        }
      }
    }
  }

  tags = var.codepipeline_tags
}
