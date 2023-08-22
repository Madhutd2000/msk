output "msk_cluster_arn" {
  description = "The ARN of the created MSK cluster."
  value       = aws_msk_cluster.example.arn
}

# Define other outputs as needed
