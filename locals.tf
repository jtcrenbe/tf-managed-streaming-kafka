locals {
  brokers_divide_subnets           = var.lld_number_of_broker_nodes / length(data.aws_subnet_ids.msk_subnet_ids.ids)
  brokers_divide_subnets_remainder = var.lld_number_of_broker_nodes % length(data.aws_subnet_ids.msk_subnet_ids.ids)
  new_number_of_broker_nodes       = local.brokers_divide_subnets_remainder == 0 ? var.lld_number_of_broker_nodes : ceil(local.brokers_divide_subnets) * length(data.aws_subnet_ids.msk_subnet_ids.ids)
  cluster_name = "${var.environment}-${var.tenant}-${var.service}-${var.project_name}"
  vpc_id_condition = var.private_dns_zone == true ? data.aws_vpc.msk_vpc.id : null
  tags = {
    "Service" = var.service,
    "Env"     = var.environment,
    "Tenant"  = var.tenant,
    "Release" = var.release,
  }
}