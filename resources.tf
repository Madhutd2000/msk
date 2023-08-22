resource "aws_msk_cluster" "example" {
  cluster_name = var.cluster_name
  kafka_version = var.kafka_version
  number_of_broker_nodes = var.broker_count



  tags = {
    Environment = var.environment,
    resource = "KafkaCluster"
  }
}


