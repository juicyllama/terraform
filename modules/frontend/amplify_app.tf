resource "aws_amplify_app" "app" {
  count                 = var.create_amplify_app ? 1 : 0
  name                  = var.amplify_app_name
  repository            = var.amplify_app_repository
  environment_variables = var.amplify_app_env_vars
  access_token          = var.amplify_app_github_pat_token

  dynamic "custom_rule" {
    for_each = var.amplify_app_custom_rules
    content {
      source    = custom_rule.value.source
      target    = custom_rule.value.target
      status    = custom_rule.value.status
      condition = custom_rule.value.condition
    }
  }
}

resource "aws_amplify_branch" "main_app" {
  count                   = length(aws_amplify_app.app)
  framework               = var.amplify_app_framework
  stage                   = "PRODUCTION"
  app_id                  = aws_amplify_app.app[count.index].id
  branch_name             = "main"
  enable_auto_build       = false
  enable_performance_mode = false
}

resource "aws_amplify_webhook" "main_app" {
  count       = length(aws_amplify_app.app)
  app_id      = aws_amplify_app.app[count.index].id
  branch_name = aws_amplify_branch.main_app[count.index].branch_name
  description = "trigger build on push to main branch"
}

resource "aws_amplify_domain_association" "app" {
  count                 = length(aws_amplify_app.app)
  app_id                = aws_amplify_app.app[count.index].id
  domain_name           = var.amplify_app_domain_name
  wait_for_verification = false

  sub_domain {
    branch_name = aws_amplify_branch.main_app[count.index].branch_name
    prefix      = var.amplify_app_prefix
  }
}
