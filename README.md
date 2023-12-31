## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.msk_cluster_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_kms_alias.msk_cluster_kms_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.msk_cluster_kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_msk_cluster.msk_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/msk_cluster) | resource |
| [aws_msk_configuration.msk_cluster_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/msk_configuration) | resource |
| [aws_route53_record.srv_kafkamsk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.msk_cluster_ports](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_subnet_ids.msk_subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.msk_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_broker"></a> [client\_broker](#input\_client\_broker) | MSK cluster nodes encryption in transit | `string` | `"TLS_PLAINTEXT"` | no |
| <a name="input_lld_dns_domain"></a> [lld\_dns\_domain](#input\_lld\_dns\_domain) | route53 zone for the cname records -> link to the MSK cluster brokers, which is used in the microservices manifests | `string` | `"lite.dev.lgi.red."` | no |
| <a name="input_lld_ebs_volume_size"></a> [lld\_ebs\_volume\_size](#input\_lld\_ebs\_volume\_size) | MSK cluster nodes ebs volume size | `number` | `512` | no |
| <a name="input_lld_instance_type"></a> [lld\_instance\_type](#input\_lld\_instance\_type) | MSK cluster nodes instance type | `string` | `"kafka.m5.large"` | no |
| <a name="input_lld_kafka_version"></a> [lld\_kafka\_version](#input\_lld\_kafka\_version) | MSK cluster version | `string` | `"2.6.1"` | no |
| <a name="input_lld_number_of_broker_nodes"></a> [lld\_number\_of\_broker\_nodes](#input\_lld\_number\_of\_broker\_nodes) | number of the brokers nodes in the MSK cluster | `number` | `2` | no |
| <a name="input_lld_subnets"></a> [lld\_subnets](#input\_lld\_subnets) | subnets for the MSK cluster nodes creation | `list(string)` | <pre>[<br>  "obo:lg1a-pod:app-mgmt-001",<br>  "obo:lg1b-pod:app-mgmt-001"<br>]</pre> | no |
| <a name="input_lld_vpc_name"></a> [lld\_vpc\_name](#input\_lld\_vpc\_name) | vpc name of the MSK cluster | `string` | `"obo"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | 2nd part of the MSK cluster name | `string` | `"obo-lite"` | no |
| <a name="input_service"></a> [service](#input\_service) | Service name | `string` | `"Managed_Streaming_Kafka"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_msk_cluster_bootstrap_brokers"></a> [msk\_cluster\_bootstrap\_brokers](#output\_msk\_cluster\_bootstrap\_brokers) | MSK cluster PLAINTEXT connection host:port pairs |
| <a name="output_msk_cluster_zookeeper_connect_string"></a> [msk\_cluster\_zookeeper\_connect\_string](#output\_msk\_cluster\_zookeeper\_connect\_string) | A comma separated list of one or more hostname:port pairs to use to connect to the Apache Zookeeper cluster |
