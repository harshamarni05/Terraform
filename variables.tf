# The AWS region where everything will be created
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# The size of the EC2 server
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# The name of the S3 bucket — must be globally unique
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-terraform-bucket-harshamarni"
}

# The environment name — dev, staging, prod
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "alert_email" {
  description = "Email address to receive SNS notifications"
  type        = string
  default     = "saisriharshavardhan@gmail.com"
}