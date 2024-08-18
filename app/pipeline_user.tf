resource "aws_iam_user" "pipeline_user" {
  name = local.pipeline_iam_username
  tags = {
    "project" : var.prefix
  }
}

resource "aws_iam_access_key" "pipeline_user" {
  user = aws_iam_user.pipeline_user.name
}

resource "aws_iam_user_login_profile" "pipeline_user" {
  user = aws_iam_user.pipeline_user.name
}

resource "aws_secretsmanager_secret" "pipeline_user" {
  name = "IAM-Users/${local.pipeline_iam_username}"
}

resource "aws_secretsmanager_secret_version" "pipeline_user" {
  secret_id = aws_secretsmanager_secret.pipeline_user.id
  secret_string = jsonencode({
    AWS_PIPELINE_ACCESS_KEY = aws_iam_access_key.pipeline_user.id,
    AWS_PIPELINE_SECRET_KEY = aws_iam_access_key.pipeline_user.secret,
    password                = aws_iam_user_login_profile.pipeline_user.password
  })
}

resource "aws_iam_user_policy_attachment" "pipeline_user" {
  user       = aws_iam_user.pipeline_user.name
  policy_arn = aws_iam_policy.codepipeline_policy.arn
}

data "aws_iam_policy_document" "codepipeline_policy" {
  statement {
    effect = "Allow"
    actions = [
      "codepipeline:StartPipelineExecution"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "codepipeline_policy" {
  name   = "${var.prefix}-pipeline-user"
  policy = data.aws_iam_policy_document.codepipeline_policy.json
}
