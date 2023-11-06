resource "aws_security_group" "msk_cluster_ports" {
  name        = local.cluster_name
  description = "Allow traffic to AWS MSK"
  vpc_id      = data.aws_vpc.msk_vpc.id
  tags        = local.tags

  ingress {
    description = "ZooKeeper_Plaintext"
    from_port   = 2181
    to_port     = 2181
    protocol    = "tcp"
    cidr_blocks = ["100.64.0.0/10"]
  }

  ingress {
    description = "kafka_Plaintext"
    from_port   = 9092
    to_port     = 9092
    protocol    = "tcp"
    cidr_blocks = ["100.64.0.0/10"]
  }

  ingress {
    description = "kafka_TLS"
    from_port   = 9094
    to_port     = 9094
    protocol    = "tcp"
    cidr_blocks = ["100.64.0.0/10"]
  }

  ingress {
    description = "Prometheus_JMX_Exporter"
    from_port   = 11001
    to_port     = 11001
    protocol    = "tcp"
    cidr_blocks = ["100.64.0.0/10"]
  }

  ingress {
    description = "Prometheus_Node_Exporter"
    from_port   = 11002
    to_port     = 11002
    protocol    = "tcp"
    cidr_blocks = ["100.64.0.0/10"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}