# aws-terraform-s3

cp terraform.template.tfvars terraform.tfvars and modify that new file accordingly or provide variables via CLI:
terraform apply \
	-var="prod_access_key=AAAAAAAAAAAAAAAAAAA" \
	-var="prod_secret_key=SuperSecretKeyForAccountA" \
	-var="test_account_id=123456789012" \
	-var="test_access_key=BBBBBBBBBBBBBBBBBBB" \
	-var="test_secret_key=SuperSecretKeyForAccountB" \
	-var="bucket_name=tf-bucket-in-prod" \
