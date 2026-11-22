# AWS Capstone Security and Cost Review

## Assessment Scope

Terraform configuration review.

Region: us-east-1

Deployment status: NOT DEPLOYED.

## Terraform Planning Evidence

Observed plan:

- 20 resources to add
- 0 resources to change
- 0 resources to destroy

No terraform apply was executed.

## Verified Design Controls

- EC2 public IP assignment disabled
- IMDSv2 required
- EBS root volume encryption enabled
- S3 public access blocking configured
- S3 SSE-S3 encryption configured
- S3 versioning configured
- CloudWatch log retention: 7 days
- CloudWatch CPU alarm threshold: 80%
- IAM instance role uses AmazonSSMManagedInstanceCore

These are configuration findings, not deployed controls.


## Architecture Review

### Addressed in Terraform Configuration

1. Private subnet and dedicated route table configured.
2. SSM and SSM Messages interface endpoints configured.
3. Private DNS enabled for both endpoints.
4. Endpoint HTTPS ingress restricted to the EC2 security group.
5. Public HTTP and HTTPS ingress rules removed.
6. EC2 public IP assignment disabled.

These configurations are validated but not deployed.

### Remaining Gaps

1. SSM Agent installation and runtime status not verified.
2. Session Manager connectivity not tested.
3. NGINX installation and application deployment pending.
4. CloudWatch log collection not configured.
5. Alarm notifications not configured.
6. AWS cost estimates not yet approved.
7. Deployment permissions and quotas not verified.

## Cost Considerations

Planned AWS resources that may generate charges:

- EC2 t3.micro instance runtime
- EBS gp3 root volume storage (16 GiB)
- Two interface VPC endpoints:
  - Systems Manager (ssm)
  - Session Manager messaging (ssmmessages)
- Interface endpoint hourly charges and data processing
- Amazon S3 storage and requests
- CloudWatch logs, metrics, and alarms

The private subnet has no NAT gateway configured.

VPC interface endpoints can incur hourly charges
even when no EC2 instance is running.

No AWS cost estimate has been calculated or approved.

Deployment remains blocked pending cost review.


## Deployment Decision

NOT READY FOR DEPLOYMENT.

Resolve architecture gaps and review pricing
before requesting deployment approval.

## Security Restrictions

- Never commit credentials or private keys.
- Never expose SSH to 0.0.0.0/0.
- Do not run terraform apply without authorization.
- Review all resource changes before deployment.
