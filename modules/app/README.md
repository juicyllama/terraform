<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backend"></a> [backend](#module\_backend) | ../backend | n/a |
| <a name="module_frontend"></a> [frontend](#module\_frontend) | ../frontend | n/a |
| <a name="module_shared"></a> [shared](#module\_shared) | ../shared | n/a |

## Resources

No resources.

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
| <a name="input_create_doppler_secrets_manager"></a> [create\_doppler\_secrets\_manager](#input\_create\_doppler\_secrets\_manager) | n/a | `bool` | `false` | no |
| <a name="input_create_ec2_tunnel"></a> [create\_ec2\_tunnel](#input\_create\_ec2\_tunnel) | n/a | `bool` | `false` | no |
| <a name="input_create_elasticache"></a> [create\_elasticache](#input\_create\_elasticache) | n/a | `bool` | `false` | no |
| <a name="input_create_mysql"></a> [create\_mysql](#input\_create\_mysql) | n/a | `bool` | `false` | no |
| <a name="input_create_vpc"></a> [create\_vpc](#input\_create\_vpc) | n/a | `bool` | `false` | no |
| <a name="input_elasticache_cluster_name"></a> [elasticache\_cluster\_name](#input\_elasticache\_cluster\_name) | n/a | `string` | `""` | no |
| <a name="input_elasticache_node_type"></a> [elasticache\_node\_type](#input\_elasticache\_node\_type) | n/a | `string` | `"cache.t3.micro"` | no |
| <a name="input_elasticache_tags"></a> [elasticache\_tags](#input\_elasticache\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_mysql_cluster_name"></a> [mysql\_cluster\_name](#input\_mysql\_cluster\_name) | n/a | `string` | `"juicyllama"` | no |
| <a name="input_mysql_instance_name"></a> [mysql\_instance\_name](#input\_mysql\_instance\_name) | n/a | `string` | `"shared-instance-1"` | no |
| <a name="input_mysql_max_capacity"></a> [mysql\_max\_capacity](#input\_mysql\_max\_capacity) | n/a | `number` | `2` | no |
| <a name="input_mysql_min_capacity"></a> [mysql\_min\_capacity](#input\_mysql\_min\_capacity) | n/a | `number` | `1` | no |
| <a name="input_mysql_security_group_id"></a> [mysql\_security\_group\_id](#input\_mysql\_security\_group\_id) | n/a | `string` | `""` | no |
| <a name="input_mysql_subnet_group_name"></a> [mysql\_subnet\_group\_name](#input\_mysql\_subnet\_group\_name) | n/a | `string` | `"default"` | no |
| <a name="input_mysql_tags"></a> [mysql\_tags](#input\_mysql\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | `"juicyllama"` | no |
| <a name="input_public_subnets_cidrs"></a> [public\_subnets\_cidrs](#input\_public\_subnets\_cidrs) | n/a | `list` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(string)` | `[]` | no |
| <a name="input_tunnel_instance_tags"></a> [tunnel\_instance\_tags](#input\_tunnel\_instance\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_tunnel_subnet_id"></a> [tunnel\_subnet\_id](#input\_tunnel\_subnet\_id) | n/a | `string` | `""` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->