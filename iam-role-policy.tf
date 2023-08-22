# Define the required IAM roles and policies for MSK (adjust policies as needed)
resource "aws_iam_role" "msk_role" {
  name = "msk-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "kafka.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "msk_policy_attachment" {
  name = "msk-policy-attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonMSKServiceRolePolicy"
  roles      = [aws_iam_role.msk_role.name]
}

# Allow MSK to access specific resources (e.g., S3, CloudWatch Logs)
resource "aws_iam_policy" "msk_access_policy" {
  name        = "msk-access-policy"
  description = "Allows MSK access to necessary resources"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "s3:GetObject",
        Resource = "arn:aws:s3:::your-msk-monitoring-bucket/*"
      },
      {
        Effect   = "Allow",
        Action   = "logs:CreateLogGroup",
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = "logs:CreateLogStream",
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = "logs:PutLogEvents",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "msk_access_attachment" {
  policy_arn = aws_iam_policy.msk_access_policy.arn
  role       = aws_iam_role.msk_role.name
}