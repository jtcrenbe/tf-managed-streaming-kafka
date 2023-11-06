data "aws_vpc" "msk_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.lld_vpc_name]
  }
}

data "aws_subnet_ids" "msk_subnet_ids" {
  vpc_id = data.aws_vpc.msk_vpc.id
  filter {
    name   = "tag:Name"
    values = var.lld_subnets
  }
}

data "aws_route53_zone" "selected" {
  name         = var.lld_dns_domain
  private_zone = var.private_dns_zone
  vpc_id       = local.vpc_id_condition
}
