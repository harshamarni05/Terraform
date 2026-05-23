output "server_id" {
  description = "The EC2 instance ID"
  value       = aws_instance.my_server.id
}

output "server_public_ip" {
  description = "The public IP of the server"
  value       = aws_instance.my_server.public_ip
}

output "s3_bucket_name" {
  description = "The S3 bucket name"
  value       = aws_s3_bucket.my_bucket.bucket
}

output "s3_bucket_arn" {
  description = "The S3 bucket ARN"
  value       = aws_s3_bucket.my_bucket.arn
}

output "aws_account_id" {
  description = "The AWS account ID"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  description = "The AWS region being used"
  value       = data.aws_region.current.name
}

output "ami_used" {
  description = "The AMI ID that was used"
  value       = data.aws_ami.amazon_linux.id
}