project_name = "lab-cloud"
private_dns_zone = false

lld_instance_type           = "kafka.m5.xlarge"
lld_kafka_version           = "3.3.2"
lld_ebs_volume_size         = 512
lld_number_of_broker_nodes  = 3

lld_dns_domain              = "example.internal"
lld_vpc_name                = "vpc-001"

lld_security_groups         = []

lld_subnets    = [
        "subnet-001",
        "subnet-002",]
tags     = {
  "Env"          = "lab"
  "Release"      = "1.0"
  "Country"      = "mt"
  "Tenant"       = "obo"
  "Service"      = "Managed_Streaming_Kafka"
  "Component"    = "Kubernetes"
  "Owner"        = "Platform team"
}
