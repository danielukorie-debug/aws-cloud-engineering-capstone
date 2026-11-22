#!/usr/bin/env bash

# Capstone Security Review
# Local inspection only
# No AWS infrastructure changes

set -euo pipefail

cd "$(dirname "$0")/../terraform"

echo "======================================"
echo "AWS CAPSTONE SECURITY REVIEW"
echo "======================================"

echo
echo "===== 1. TERRAFORM FORMATTING ====="
terraform fmt -check

echo
echo "===== 2. TERRAFORM VALIDATION ====="
terraform validate

echo
echo "===== 3. EC2 PUBLIC IP ====="
grep -n 'associate_public_ip_address = false' ec2.tf

echo
echo "===== 4. IMDSv2 ====="
grep -n 'http_tokens *= *"required"' ec2.tf

echo
echo "===== 5. EBS ENCRYPTION ====="
grep -n 'encrypted *= *true' ec2.tf

echo
echo "===== 6. S3 PUBLIC ACCESS BLOCK ====="
grep -n 'block_public_acls *= *true' s3.tf
grep -n 'block_public_policy *= *true' s3.tf
grep -n 'ignore_public_acls *= *true' s3.tf
grep -n 'restrict_public_buckets *= *true' s3.tf

echo
echo "===== 7. S3 ENCRYPTION ====="
grep -n 'sse_algorithm *= *"AES256"' s3.tf

echo
echo "===== 8. S3 VERSIONING ====="
grep -n 'status *= *"Enabled"' s3.tf

echo
echo "===== 9. CLOUDWATCH RETENTION ====="
grep -n 'retention_in_days *= *7' cloudwatch.tf

echo
echo "===== 10. CLOUDWATCH CPU ALARM ====="
grep -n 'threshold *= *80' cloudwatch.tf

echo
echo "===== 11. NETWORK RESOURCE INVENTORY ====="
grep -h '^resource "aws_\(vpc\|subnet\|route\|internet_gateway\|nat_gateway\|vpc_endpoint\)' *.tf || true

echo
echo "===== 12. SSH INGRESS REVIEW ====="
if grep -R -n 'from_port *= *22' --include='*.tf' .; then
  echo "REVIEW REQUIRED: Port 22 appears in configuration."
else
  echo "No explicit port 22 rule found."
fi

echo
echo "===== 13. REVIEW COMPLETE ====="
echo "Local configuration inspected."
echo "Deployment readiness: NOT READY."
echo "No AWS resources created or modified."
