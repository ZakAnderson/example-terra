variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "af-south-1"
}

variable "s3_bucket_name" {
  description = "The name of the branch that's being deployed"
}

variable "environment" {
  description = "The name of the branch that's being deployed"
}
