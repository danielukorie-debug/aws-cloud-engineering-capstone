# AWS Cloud Engineering Capstone

## Terraform Validation Evidence

### Project Information

- AWS Region: us-east-1
- Operating System: Ubuntu WSL2
- Infrastructure Tool: Terraform
- Deployment Status: PLAN ONLY — NOT DEPLOYED

### Terraform Formatting

Command:

`terraform fmt -check`

Observed result: Passed.

### Terraform Validation

Command:

`terraform validate`

Observed result:

Success! The configuration is valid.

### Terraform Plan

Command:

`terraform plan -input=false -lock=false -no-color`

Latest observed result:

Plan: 20 to add, 0 to change, 0 to destroy.

Deployment status: PLAN ONLY — NOT DEPLOYED.

### Security Controls

- EC2 public IP disabled
- IMDSv2 required
- EBS encryption enabled
- S3 public access blocking configured
- S3 encryption and versioning configured
- CloudWatch log retention: 7 days
- CloudWatch CPU alarm threshold: 80%
- No explicit SSH ingress rule found


### Private Networking and SSM Validation

Configuration inspection confirmed:

- EC2 public IP assignment disabled.
- Private subnet: 10.20.1.0/24.
- Dedicated private route table and association.
- No public inbound SSH, HTTP, or HTTPS rules.
- EC2 outbound HTTPS permitted on TCP 443.
- SSM interface VPC endpoint configured.
- SSM Messages interface VPC endpoint configured.
- Private DNS enabled on both endpoints.
- Endpoint HTTPS ingress restricted to the EC2 security group.
- IAM role configured with AmazonSSMManagedInstanceCore.
- IAM instance profile associated with EC2.

Observed commands:

```bash
terraform fmt -check
terraform validate
```

Observed validation result:

Success! The configuration is valid.

These findings are based on Terraform configuration
inspection and validation, not runtime testing.

### Security Review

Command:

`./scripts/review-security.sh`

Observed result:

Local configuration inspected.

Deployment readiness: NOT READY.

No AWS resources created or modified.

### Screenshot Evidence

![Terraform Validation](../screenshots/capstone-validation.png)


### Deployment Readiness

**NOT READY FOR DEPLOYMENT.**

Completed configuration work:

1. Private subnet and route table design.
2. Private SSM and SSM Messages endpoint definitions.
3. Security group restrictions.
4. IAM role and instance profile configuration.
5. Terraform formatting and validation.

Pending work:

1. Verify SSM Agent installation and runtime status.
2. Verify Systems Manager instance registration.
3. Test Session Manager connectivity.
4. Install and test NGINX.
5. Configure and test CloudWatch log delivery.
6. Configure alarm notifications.
7. Complete AWS cost estimation and approval.
8. Verify deployment permissions and service quotas.

No Terraform resources have been deployed.


### Conclusion

This capstone demonstrates Terraform, AWS infrastructure
planning, Linux, Bash, security review, and GitHub skills.

No terraform apply was executed.
