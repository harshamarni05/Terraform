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
