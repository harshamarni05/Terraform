# Automatically fetch the latest Amazon Linux 2023 AMI
# No more hardcoded AMI IDs that go out of date
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# Fetch your current AWS account ID automatically
data "aws_caller_identity" "current" {}

# Fetch information about the current region
data "aws_region" "current" {}