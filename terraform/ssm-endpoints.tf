# Security group for private Systems Manager endpoints.

resource "aws_security_group" "ssm_endpoints" {
  name_prefix = "${var.project_name}-ssm-endpoints-"
  description = "Private SSM interface endpoint security group"
  vpc_id      = aws_vpc.capstone.id

  tags = {
    Name = "${var.project_name}-ssm-endpoints-sg"
  }
}

# Allow HTTPS only from the capstone EC2 security group.

resource "aws_vpc_security_group_ingress_rule" "ssm_https" {
  security_group_id            = aws_security_group.ssm_endpoints.id
  referenced_security_group_id = aws_security_group.web.id

  description = "HTTPS from private EC2 to SSM endpoints"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
}
# Private endpoint for AWS Systems Manager.

resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.capstone.id
  service_name        = "com.amazonaws.${var.aws_region}.ssm"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [aws_subnet.private.id]
  security_group_ids  = [aws_security_group.ssm_endpoints.id]
  private_dns_enabled = true

  tags = {
    Name = "${var.project_name}-ssm-endpoint"
  }
}

# Private endpoint for Session Manager messaging.

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id              = aws_vpc.capstone.id
  service_name        = "com.amazonaws.${var.aws_region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [aws_subnet.private.id]
  security_group_ids  = [aws_security_group.ssm_endpoints.id]
  private_dns_enabled = true

  tags = {
    Name = "${var.project_name}-ssmmessages-endpoint"
  }
}
