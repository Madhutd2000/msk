# This file is used as an entry point to include the other Terraform files
module "msk_cluster" {
  source = "./"

  # Pass variables to the module
  region       = var.region
  cluster_name = var.cluster_name
  kafka_version = var.kafka_version
  broker_count = var.broker_count
}

# Optionally, you can define additional modules or resources here
