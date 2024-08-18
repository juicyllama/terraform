# The `aws_codestarconnections_connection` resource is created in the state `PENDING`.
# Authentication with the connection provider must be completed in the AWS Console
resource "aws_codestarconnections_connection" "github" {
  count         = var.create_ci_cd ? 1 : 0
  name          = var.codestar_connection_name
  provider_type = "GitHub"
}
