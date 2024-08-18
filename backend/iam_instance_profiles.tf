resource "aws_iam_instance_profile" "aws_elasticbeanstalk_ec2_instance_profile" {
  count = var.create_elastic_beanstalk && var.create_eb_iam_profile ? 1 : 0
  name  = length(split("staging", var.domain)) > 1 ? "aws-elasticbeanstalk-ec2-role-staging" : "aws-elasticbeanstalk-ec2-role"
  role  = length(split("staging", var.domain)) > 1 ? "aws-elasticbeanstalk-ec2-role-staging" : "aws-elasticbeanstalk-ec2-role"
}

