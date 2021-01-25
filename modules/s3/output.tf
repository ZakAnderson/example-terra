output "arn" {
	value = aws_s3_bucket.primary.arn
}

output "bucket_domain_name" {
	value = aws_s3_bucket.primary.bucket_domain_name
}

output "bucket_regional_domain_name" {
	value = aws_s3_bucket.primary.bucket_regional_domain_name
}
