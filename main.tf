/*
# Description

This module creates Amazon Managed Streaming for Apache Kafka (Amazon MSK)
https://aws.amazon.com/ru/msk/
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/msk_cluster 

## Module minimal usage:

 module "managed_streaming_kafka" {
     source               = "ssh://git@bitbucket.internal:7999/yourproject/tf-managed-streaming-kafka.git"
     lld_vpc_name               = "${var.lld_vpc_name}"
     cluster_name         = "${var.cluster_name}"
     lld_number_of_broker_nodes = "${var.lld_number_of_broker_nodes}"
     lld_kafka_version = "${var.lld_kafka_version}"
     lld_instance_type = "${var.lld_instance_type}"
     lld_ebs_volume_size = "${var.lld_ebs_volume_size}"
     client_broker = "${var.client_broker}"
     lld_subnets = "${var.lld_subnets}"
 }
*/

resource "aws_kms_key" "msk_cluster_kms" {
  description = local.cluster_name
  tags = local.tags
  enable_key_rotation = true
}

resource "aws_kms_alias" "msk_cluster_kms_alias" {
  name          = "alias/${local.cluster_name}"
  target_key_id = aws_kms_key.msk_cluster_kms.key_id
}

resource "aws_cloudwatch_log_group" "msk_cluster_log_group" {
  name              = "/aws/msk/${local.cluster_name}/cluster"
  retention_in_days = 30
}

resource "aws_msk_configuration" "msk_cluster_config" {
  kafka_versions    = [var.lld_kafka_version]
  name              = "${local.cluster_name}-${var.lld_kafka_version}"
  server_properties = templatefile("kafka_config/${local.cluster_name}.tpl", {msk_number_of_broker_nodes = "${local.new_number_of_broker_nodes}"})
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_msk_cluster" "msk_cluster" {
  cluster_name           = local.cluster_name
  kafka_version          = var.lld_kafka_version
  number_of_broker_nodes = local.new_number_of_broker_nodes

  broker_node_group_info {
    instance_type   = var.lld_instance_type
    ebs_volume_size = var.lld_ebs_volume_size
    client_subnets  = slice(sort(tolist(data.aws_subnet_ids.msk_subnet_ids.ids)), 0, length(data.aws_subnet_ids.msk_subnet_ids.ids))
    security_groups = [aws_security_group.msk_cluster_ports.id]
  }
  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.msk_cluster_kms.arn
    encryption_in_transit {
      client_broker = var.client_broker
    }
  }
  configuration_info {
    arn      = aws_msk_configuration.msk_cluster_config.arn
    revision = aws_msk_configuration.msk_cluster_config.latest_revision
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = true
      }
      node_exporter {
        enabled_in_broker = true
      }
    }
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = aws_cloudwatch_log_group.msk_cluster_log_group.name
      }
    }
  }

  tags = local.tags

}

