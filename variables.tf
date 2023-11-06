variable "project_name" {
  description = "2nd part of the MSK cluster name"
  type        = string
  default     = "obo"
}

variable "service" {
  description = "Service name"
  type        = string
  default     = "msk"
}

variable "lld_number_of_broker_nodes" {
  description = "number of the brokers nodes in the MSK cluster"
  type        = number
  default     = 2
}

variable "lld_kafka_version" {
  description = "MSK cluster version"
  type        = string
  default     = "2.6.1"
}

variable "lld_instance_type" {
  description = "MSK cluster nodes instance type"
  type        = string
  default     = "kafka.m5.large"
}

variable "lld_ebs_volume_size" {
  description = "MSK cluster nodes ebs volume size"
  type        = number
  default     = 512
}

variable "client_broker" {
  description = "MSK cluster nodes encryption in transit"
  type        = string
  default     = "TLS_PLAINTEXT"
}

variable "lld_vpc_name" {
  description = "vpc name of the MSK cluster"
  type        = string
  default     = "obo"
}

variable "lld_dns_domain" {
  description = "route53 zone for the cname records -> link to the MSK cluster brokers, which is used in the microservices manifests"
  type        = string
  default     = "dev.internal."
}

variable "lld_subnets" {
  description = "subnets for the MSK cluster nodes creation"
  type        = list(string)
  default     = ["subnet-001","subnet-002"]
}

variable "private_dns_zone" {
  description = "Private/public dns zone definition"
  type        = bool
  default     = true
}

variable "environment" {
  description = "environment"
  type        = string
  default     = "lab"
}

variable "tenant" {
  description = "tenant"
  type        = string
  default     = "obo"
}

variable "release" {
  description = "release"
  type        = string
  default     = "R1.0"
}
