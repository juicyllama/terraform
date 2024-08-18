resource "aws_iam_role" "doppler" {
  count = var.doppler_external_id != "" ? 1 : 0
  name  = startswith(var.prefix, "staging") ? "staging-doppler" : "doppler"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          AWS = "arn:aws:iam::299900769157:root"
        }
        Condition = {
          StringEquals = {
            "sts:ExternalId" = var.doppler_external_id
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "doppler" {
  count = var.doppler_external_id != "" ? 1 : 0
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret",
          "secretsmanager:PutSecretValue",
          "secretsmanager:CreateSecret",
          "secretsmanager:DeleteSecret",
          "secretsmanager:TagResource",
          "secretsmanager:UpdateSecret",
          "ssm:PutParameter",
          "ssm:LabelParameterVersion",
          "ssm:DeleteParameter",
          "ssm:RemoveTagsFromResource",
          "ssm:GetParameterHistory",
          "ssm:AddTagsToResource",
          "ssm:GetParametersByPath",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:DeleteParameters"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
  name = var.doppler_policy_name
}

resource "aws_iam_role_policy_attachment" "doppler" {
  count      = var.doppler_external_id != "" ? 1 : 0
  policy_arn = aws_iam_policy.doppler[0].arn
  role       = aws_iam_role.doppler[0].name
}
