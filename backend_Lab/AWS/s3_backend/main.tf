terraform {
  required_version = ">= 1.16.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Used to build a globally unique bucket name
data "aws_caller_identity" "current" {}

# Bucket that will store the Terraform state file
resource "aws_s3_bucket" "state" {
  bucket = "lab-tf-state-${data.aws_caller_identity.current.account_id}"

  # Allows terraform destroy to remove the bucket even when it
  # still contains state files and old object versions
  force_destroy = true

  tags = {
    Name    = "lab-tf-state"
    Purpose = "terraform-remote-state"
  }
}

# Keep old versions of the state file so it can be recovered
resource "aws_s3_bucket_versioning" "state" {
  bucket = aws_s3_bucket.state.id

  versioning_configuration {
    status = "Enabled"
  }
}

output "state_bucket_name" {
  description = "Name of the S3 bucket that stores Terraform state"
  value       = aws_s3_bucket.state.bucket
}