data "aws_iam_policy_document" "assume_aws_elasticbeanstalk_ec2_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "aws_elasticbeanstalk_ec2_role" {
  statement {
    actions   = ["secretsmanager:*"]
    effect    = "Allow"
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "assume_aws_elasticbeanstalk_service_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["elasticbeanstalk.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      values   = ["elasticbeanstalk"]
      variable = "sts:ExternalId"
    }
  }
}

data "aws_iam_policy_document" "aws_elasticbeanstalk_service_role" {
  statement {
    actions   = ["secretsmanager:*"]
    effect    = "Allow"
    resources = ["*"]
  }
}
