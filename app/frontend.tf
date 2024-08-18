module "frontend" {
  count                        = length(var.frontends)
  source                       = "../frontend"
  create_amplify_app           = local.create_amplify_app
  amplify_app_repository       = lookup(var.frontends[count.index], "repository", "https://github.com/juicyllama/juicyllama-app")
  amplify_app_env_vars         = lookup(var.frontends[count.index], "env_vars", {})
  amplify_app_domain_name      = lookup(var.frontends[count.index], "domain_name", "juicyllama.com")
  amplify_app_name             = lookup(var.frontends[count.index], "name", "juicyllama-frontend")
  amplify_app_framework        = lookup(var.frontends[count.index], "framework", "Vue")
  amplify_app_github_pat_token = lookup(var.frontends[count.index], "github_pat_token", "")
  amplify_app_prefix           = lookup(var.frontends[count.index], "prefix", "")
  prefix                       = var.prefix
  amplify_app_custom_rules      = lookup(var.frontends[count.index], "custom_rules", [])
}
