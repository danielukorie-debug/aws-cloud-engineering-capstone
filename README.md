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

**16 to add, 0 to change, 0 to destroy**

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

## Architecture

See [Architecture Documentation](docs/architecture.md).

## Validation Evidence

See [Validation Evidence](docs/validation-evidence.md).

## Security and Cost Review

See [Security and Cost Review](docs/security-cost-review.md).

## Deployment Readiness

NOT READY FOR DEPLOYMENT.

Remaining work includes:

- Systems Manager network connectivity
- Subnet and routing design
- NGINX installation
- CloudWatch log delivery
- Alarm notifications
- Cost estimation and approval

## Security Warning

Do not commit credentials, private keys,
Terraform state files, or sensitive variables.

Do not run terraform apply without approval.

## Author

AWS Cloud Engineering Portfolio Project
