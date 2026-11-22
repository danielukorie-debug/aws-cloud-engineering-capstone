# AWS Cloud Engineering Capstone

## Project Overview

A Terraform-based AWS infrastructure design demonstrating
cloud networking, compute, IAM, storage, monitoring,
security controls, and infrastructure-as-code practices.

**Project status: VALIDATED — PLAN ONLY — NOT DEPLOYED**

## Technologies

- AWS VPC and EC2
- AWS IAM and Systems Manager
- Amazon S3
- Amazon CloudWatch
- Terraform
- Ubuntu Linux
- Bash
- Git and GitHub

## Terraform Validation

The following commands completed successfully:

- terraform fmt -check
- terraform validate
- terraform plan

Observed Terraform plan:

**20 to add, 0 to change, 0 to destroy**

No terraform apply was executed.

## Security Design

- No EC2 public IP
- IMDSv2 required
- Encrypted EBS root volume
- S3 public access blocking
- S3 server-side encryption
- S3 versioning
- IAM instance role for Systems Manager
- CloudWatch log retention and CPU alarm
- No explicit SSH ingress rule

These controls are planned, not deployed.
- Private EC2 subnet with no public IP assignment
- Dedicated private route table and subnet association
- Interface VPC endpoints for SSM and SSM Messages
- Private DNS enabled on both endpoints
- Endpoint HTTPS ingress restricted to the EC2 security group
- EC2 outbound HTTPS permitted
- No public inbound HTTP, HTTPS, or SSH rules

## Architecture

See [Architecture Documentation](docs/architecture.md).

## Validation Evidence

See [Validation Evidence](docs/validation-evidence.md).

## Security and Cost Review

See [Security and Cost Review](docs/security-cost-review.md).

## Deployment Readiness

**NOT READY FOR DEPLOYMENT.**

### Validated Terraform Configuration

- Private VPC subnet and route table
- Private subnet route table association
- EC2 instance without a public IP
- EC2 IAM role and instance profile
- AmazonSSMManagedInstanceCore policy attachment
- Private SSM and SSM Messages interface endpoints
- Private DNS enabled for both endpoints
- Security-group-restricted HTTPS endpoint access
- Terraform formatting, validation, and planning

### Pending Runtime Verification

- Confirm SSM Agent is installed and running on EC2
- Verify EC2 registers with Systems Manager
- Verify Session Manager connection permissions
- Test private endpoint connectivity
- Install and validate NGINX
- Configure and test CloudWatch log delivery
- Configure alarm notifications
- Complete AWS cost estimation and approval

No Terraform resources have been deployed.

## Security Warning

Do not commit credentials, private keys,
Terraform state files, or sensitive variables.

Do not run terraform apply without approval.

## Author

AWS Cloud Engineering Portfolio Project
