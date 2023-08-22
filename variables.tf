variable "region" {
  description = "The AWS region where resources will be created."
  default     = "us-east-2"
}

variable "environment" {
  description = "Name of the MSK cluster."
  default     = "dev"
}

variable "cluster_name" {
  description = "Name of the MSK cluster."
  default     = "my-msk-cluster"
}

variable "kafka_version" {
  description = "Version of Apache Kafka to use."
  default     = "2.8.0"
}

variable "broker_count" {
  description = "Number of broker nodes in the cluster."
  default     = 3
}

# Define other variables like instance_type, security_group, IAM roles, policies, etc.
