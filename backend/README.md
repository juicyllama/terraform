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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aurora_mysql"></a> [aurora\_mysql](#module\_aurora\_mysql) | terraform-aws-modules/rds-aurora/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_cluster.first](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |
| [aws_elasticache_replication_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_instance.tunnel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_secretsmanager_secret.doppler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_security_group.tunnel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.ssh_tunnel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_key_pair.juicyllama_studio](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/key_pair) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_doppler_secrets_manager"></a> [create\_doppler\_secrets\_manager](#input\_create\_doppler\_secrets\_manager) | n/a | `bool` | `false` | no |
| <a name="input_create_ec2_tunnel"></a> [create\_ec2\_tunnel](#input\_create\_ec2\_tunnel) | n/a | `bool` | `false` | no |
| <a name="input_create_elasticache"></a> [create\_elasticache](#input\_create\_elasticache) | n/a | `bool` | `false` | no |
| <a name="input_create_mysql"></a> [create\_mysql](#input\_create\_mysql) | n/a | `bool` | `false` | no |
| <a name="input_elasticache_cluster_name"></a> [elasticache\_cluster\_name](#input\_elasticache\_cluster\_name) | n/a | `string` | `""` | no |
| <a name="input_elasticache_node_type"></a> [elasticache\_node\_type](#input\_elasticache\_node\_type) | n/a | `string` | `"cache.t3.micro"` | no |
| <a name="input_elasticache_subnet_ids"></a> [elasticache\_subnet\_ids](#input\_elasticache\_subnet\_ids) | n/a | `list(string)` | `[]` | no |
| <a name="input_elasticache_tags"></a> [elasticache\_tags](#input\_elasticache\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_mysql_cluster_name"></a> [mysql\_cluster\_name](#input\_mysql\_cluster\_name) | n/a | `string` | `"juicyllama"` | no |
| <a name="input_mysql_instance_name"></a> [mysql\_instance\_name](#input\_mysql\_instance\_name) | n/a | `string` | `"shared-instance-1"` | no |
| <a name="input_mysql_max_capacity"></a> [mysql\_max\_capacity](#input\_mysql\_max\_capacity) | n/a | `number` | `2` | no |
| <a name="input_mysql_min_capacity"></a> [mysql\_min\_capacity](#input\_mysql\_min\_capacity) | n/a | `number` | `1` | no |
| <a name="input_mysql_security_group_ids"></a> [mysql\_security\_group\_ids](#input\_mysql\_security\_group\_ids) | n/a | `list(string)` | `[]` | no |
| <a name="input_mysql_subnet_group_name"></a> [mysql\_subnet\_group\_name](#input\_mysql\_subnet\_group\_name) | n/a | `string` | `"default"` | no |
| <a name="input_mysql_tags"></a> [mysql\_tags](#input\_mysql\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_mysql_vpc_id"></a> [mysql\_vpc\_id](#input\_mysql\_vpc\_id) | n/a | `string` | `""` | no |
| <a name="input_tunnel_instance_tags"></a> [tunnel\_instance\_tags](#input\_tunnel\_instance\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_tunnel_subnet_id"></a> [tunnel\_subnet\_id](#input\_tunnel\_subnet\_id) | n/a | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->