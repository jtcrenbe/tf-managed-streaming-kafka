output "msk_cluster_zookeeper_connect_string" {
  description = "A comma separated list of one or more hostname:port pairs to use to connect to the Apache Zookeeper cluster"
  value       = aws_msk_cluster.msk_cluster.zookeeper_connect_string
}

output "msk_cluster_bootstrap_brokers" {
  description = "MSK cluster PLAINTEXT connection host:port pairs"
  value       = aws_msk_cluster.msk_cluster.bootstrap_brokers
}