resource "aws_iam_role" "aws_codebuild_role" {
  count = var.create_ci_cd ? 1 : 0
  name  = "${var.prefix}-${var.codebuild_project_name}-codebuild"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/SecretsManagerReadWrite",
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
  ]
  assume_role_policy = data.aws_iam_policy_document.assume_aws_codebuild_role.json
}

resource "aws_iam_role" "aws_codepipeline_role" {
  count              = var.create_ci_cd ? 1 : 0
  name               = "${var.prefix}-${var.codepipeline_project_name}-codepipeline"
  assume_role_policy = data.aws_iam_policy_document.assume_aws_codepipeline_role.json
}

resource "aws_iam_role_policy_attachment" "aws_codepipeline_role_policy_attachment" {
  count      = var.create_ci_cd ? 1 : 0
  role       = aws_iam_role.aws_codepipeline_role[0].name
  policy_arn = aws_iam_policy.codepipeline_service_policy.arn
}

resource "aws_iam_role_policy_attachment" "aws_codepipeline_role_cloudwatch_policy_attachment" {
  count      = var.create_ci_cd ? 1 : 0
  role       = aws_iam_role.aws_codepipeline_role[0].name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}
