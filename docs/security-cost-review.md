# AWS Capstone Security and Cost Review

## Assessment Scope

Terraform configuration review.

Region: us-east-1

Deployment status: NOT DEPLOYED.

## Terraform Planning Evidence

Observed plan:

- 16 resources to add
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

## Architecture Gaps

1. No configured network path to Systems Manager.
2. No internet gateway or route table for the named public subnet.
3. No NGINX installation or application deployment.
4. Public HTTP and HTTPS ingress rules need review.
5. CloudWatch log collection is not configured.
6. Alarm notifications are not configured.
7. Cost estimates are not yet approved.
8. Deployment permissions and quotas have not been verified.

## Cost Considerations

Potential charges include:

- EC2 instance runtime
- EBS storage
- S3 storage and requests
- CloudWatch logs and alarms
- Future VPC endpoints, NAT gateways, or load balancers

No cost estimate has been calculated yet.

## Deployment Decision

NOT READY FOR DEPLOYMENT.

Resolve architecture gaps and review pricing
before requesting deployment approval.

## Security Restrictions

- Never commit credentials or private keys.
- Never expose SSH to 0.0.0.0/0.
- Do not run terraform apply without authorization.
- Review all resource changes before deployment.
