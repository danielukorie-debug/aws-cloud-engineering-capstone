resource "aws_cloudwatch_log_group" "capstone" {
  name              = "/capstone/ec2/application"
  retention_in_days = 7

  tags = {
    Name = "capstone-application-logs"
  }
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "capstone-ec2-high-cpu"
  alarm_description   = "Alarm when EC2 CPU exceeds 80 percent."
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    InstanceId = aws_instance.web.id
  }

  treat_missing_data = "missing"

  tags = {
    Name = "capstone-high-cpu-alarm"
  }
}
