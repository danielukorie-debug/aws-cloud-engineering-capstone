output "vpc_id" {
  description = "ID of the planned capstone VPC."
  value       = aws_vpc.capstone.id
}

output "private_subnet_id" {
  description = "Private subnet ID."
  value       = aws_subnet.private.id
}

output "web_security_group_id" {
  description = "ID of the planned web security group."
  value       = aws_security_group.web.id
}

output "ec2_instance_id" {
  description = "ID of the planned EC2 instance."
  value       = aws_instance.web.id
}

output "ec2_private_ip" {
  description = "Private IP of the planned EC2 instance."
  value       = aws_instance.web.private_ip
}

output "ec2_iam_role_name" {
  description = "IAM role assigned to the planned EC2 instance."
  value       = aws_iam_role.ec2_ssm.name
}

output "s3_bucket_name" {
  description = "Name of the planned secure S3 bucket."
  value       = aws_s3_bucket.capstone.id
}

output "cloudwatch_log_group_name" {
  description = "Name of the planned CloudWatch log group."
  value       = aws_cloudwatch_log_group.capstone.name
}

output "cloudwatch_cpu_alarm_name" {
  description = "Name of the planned EC2 CPU alarm."
  value       = aws_cloudwatch_metric_alarm.high_cpu.alarm_name
}
