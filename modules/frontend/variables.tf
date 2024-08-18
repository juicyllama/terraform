variable "prefix" {
  default = "juicyllama"
}

variable "create_amplify_docs" {
  default = false
}

variable "amplify_docs_domain_name" {
  default = "juicyllama.com"
}

# variable "amplify_docs_repository" {
#   default = "https://github.com/juicyllama/docs"
# }

variable "create_amplify_app" {
  default = false
}

variable "amplify_app_domain_name" {
  default = "juicyllama.com"
}

# variable "amplify_docs_name" {
#   default = "juicyllama-docs"
# }

variable "amplify_app_repository" {
  default = "https://github.com/juicyllama/juicyllama-app"
}

variable "amplify_app_env_vars" {
  type    = map(string)
  default = {}
}

variable "amplify_docs_env_vars" {
  type    = map(string)
  default = {}
}

variable "amplify_app_name" {
  default = "juicyllama-frontend"
}

variable "amplify_app_framework" {
  default = "Vue"
}

variable "amplify_app_prefix" {
  default = ""
}

variable "amplify_app_github_pat_token" {
  type = string
}

variable "amplify_app_custom_rules" {
  default = []
  type = list(object({
    source    = string # Required
    target    = string # Required
    status    = any    # Use null if not passing
    condition = any    # Use null if not passing
  }))
  description = "The custom rules to apply to the Amplify App."
}