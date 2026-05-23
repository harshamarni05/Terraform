# EC2 Instance
resource "aws_instance" "my_server" {
  ami           = data.aws_ami.amazon_linux.id  # from data.tf — always latest
  instance_type = var.instance_type              # from variables.tf

  tags = merge(local.common_tags, {              # from locals.tf
    Name = "${local.name_prefix}-server"
  })
}

# S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name                       # from variables.tf

  tags = merge(local.common_tags, {              # from locals.tf
    Name = "${local.name_prefix}-bucket"
  })
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "my_bucket_access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 1. Create the SNS Topic — the notification channel
resource "aws_sns_topic" "alerts" {
  name = "${local.name_prefix}-alerts"

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-alerts"
  })
}

# 2. Subscribe your email to the topic
resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}
