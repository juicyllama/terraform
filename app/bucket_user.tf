resource "aws_iam_user" "bucket_user" {
  name = local.bucket_iam_username
  tags = {
    "project" : var.prefix
  }
}

resource "aws_iam_access_key" "bucket_user" {
  user = aws_iam_user.bucket_user.name
}

resource "aws_iam_user_login_profile" "bucket_user" {
  user = aws_iam_user.bucket_user.name
}

resource "aws_secretsmanager_secret" "bucket_user" {
  name = "IAM-Users/${local.bucket_iam_username}"
}

resource "aws_secretsmanager_secret_version" "bucket_user" {
  secret_id = aws_secretsmanager_secret.bucket_user.id
  secret_string = jsonencode({
    AWS_BUCKET_ACCESS_KEY = aws_iam_access_key.bucket_user.id,
    AWS_BUCKET_SECRET_KEY = aws_iam_access_key.bucket_user.secret,
    password                = aws_iam_user_login_profile.bucket_user.password
  })
}

resource "aws_iam_user_policy_attachment" "bucket_user" {
  user       = aws_iam_user.bucket_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
