# Setting Up Remote State
terraform {
  # Terraform version at the time of writing this post
  required_version = ">= 0.12.24"

  backend "s3" {
    bucket = "zaktest-s3-mdeva"
    key    = "example-key"
    region = "af-south-1"
  }
}

# Terraform AWS Provider
# Docs: https://www.terraform.io/docs/providers/aws/index.html
provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "primary" {
  bucket        = "zak-test-web-${var.branch_name}"
  force_destroy = true
  policy        = <<POLICY
{
  "Id": "bucket_policy_site",
  "Version":"2012-10-17",
  "Statement": [
    {
      "Sid": "PublicRead",
      "Action": ["s3:GetObject"],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::zaktest-web-${var.branch_name}/*",
      "Principal": "*"
    }
  ]
}
POLICY

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = {
    Name    = "Acid Web - PR"
    Branch    = var.branch_name
    Project = "Acid Web"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.primary.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
