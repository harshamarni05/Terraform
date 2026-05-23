locals {
  # A common set of tags applied to every resource
  common_tags = {
    Environment = var.environment
    Project     = "terraform-jenkins-aws"
    ManagedBy   = "Terraform"
    Owner       = "harshamarni"
  }

  # A name prefix used across all resources
  name_prefix = "${var.environment}-terraform"
}