resource "aws_iam_role" "aws_elasticbeanstalk_ec2_role" {
  count = var.create_elastic_beanstalk && var.create_eb_iam_profile ? 1 : 0
  name  = length(split("staging", var.domain)) > 1 ? "aws-elasticbeanstalk-ec2-role-staging" : "aws-elasticbeanstalk-ec2-role"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
  ]
  inline_policy {
    name   = "EC2@SecretsManager"
    policy = data.aws_iam_policy_document.aws_elasticbeanstalk_ec2_role.json
  }
  assume_role_policy = data.aws_iam_policy_document.assume_aws_elasticbeanstalk_ec2_role.json
}

resource "aws_iam_role" "aws_elasticbeanstalk_service_role" {
  count = var.create_elastic_beanstalk && var.create_eb_iam_profile ? 1 : 0
  name  = length(split("staging", var.domain)) > 1 ? "aws-elasticbeanstalk-service-role-staging" : "aws-elasticbeanstalk-service-role"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy",
    "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkService"
  ]
  inline_policy {
    name   = "EC2@SecretsManager"
    policy = data.aws_iam_policy_document.aws_elasticbeanstalk_service_role.json
  }
  assume_role_policy = data.aws_iam_policy_document.assume_aws_elasticbeanstalk_service_role.json
}
