<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_amplify_app.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_app) | resource |
| [aws_amplify_app.docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_app) | resource |
| [aws_amplify_branch.main_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_branch) | resource |
| [aws_amplify_branch.main_docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_branch) | resource |
| [aws_amplify_domain_association.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_domain_association) | resource |
| [aws_amplify_domain_association.docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_domain_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amplify_app_domain_name"></a> [amplify\_app\_domain\_name](#input\_amplify\_app\_domain\_name) | n/a | `string` | `"juicyllama.com"` | no |
| <a name="input_amplify_app_env_vars"></a> [amplify\_app\_env\_vars](#input\_amplify\_app\_env\_vars) | n/a | `map(string)` | `{}` | no |
| <a name="input_amplify_app_repository"></a> [amplify\_app\_repository](#input\_amplify\_app\_repository) | n/a | `string` | `"https://github.com/juicyllama/juicyllama-app"` | no |
| <a name="input_amplify_docs_domain_name"></a> [amplify\_docs\_domain\_name](#input\_amplify\_docs\_domain\_name) | n/a | `string` | `"juicyllama.com"` | no |
| <a name="input_amplify_docs_repository"></a> [amplify\_docs\_repository](#input\_amplify\_docs\_repository) | n/a | `string` | `"https://github.com/juicyllama/docs"` | no |
| <a name="input_create_amplify_app"></a> [create\_amplify\_app](#input\_create\_amplify\_app) | n/a | `bool` | `false` | no |
| <a name="input_create_amplify_docs"></a> [create\_amplify\_docs](#input\_create\_amplify\_docs) | n/a | `bool` | `false` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | `"juicyllama"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->