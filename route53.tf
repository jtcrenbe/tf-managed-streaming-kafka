resource "aws_route53_record" "srv_kafkamsk" {
  count   = length(data.aws_subnet_ids.msk_subnet_ids.ids)
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = length(regexall("prod", "${var.environment}")) > 0 ? "srv-kafkamsk-${var.project_name}-00${count.index + 1}.${var.environment}" : "srv-kafkamsk-${var.project_name}-00${count.index + 1}"
  type    = "CNAME"
  ttl     = "300"
  records = [split(":", split(",", aws_msk_cluster.msk_cluster.bootstrap_brokers)[count.index])[0]]
}

resource "aws_route53_record" "srv_zookeepermsk" {
  count   = length(data.aws_subnet_ids.msk_subnet_ids.ids)
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = length(regexall("prod", "${var.environment}")) > 0 ? "srv-zookeepermsk-${var.project_name}-00${count.index + 1}.${var.environment}" : "srv-zookeepermsk-${var.project_name}-00${count.index + 1}"
  type    = "CNAME"
  ttl     = "300"
  records = [split(":", split(",", aws_msk_cluster.msk_cluster.zookeeper_connect_string)[count.index])[0]]
}
