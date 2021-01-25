# Setting Up Remote State
terraform {
  required_version = ">= 0.13"
}
resource "aws_s3_bucket" "primary" {
  bucket        = "s3-terraform-statefile-zaktest"
  force_destroy = true
  acl    	= "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
}
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.primary.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls 	= true
  restrict_public_buckets = true
}
