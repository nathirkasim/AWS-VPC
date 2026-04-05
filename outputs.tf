# outputs.tf

# ─── VPC ──────────────────────────────────────────────────────────────────
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

# ─── SUBNETS ──────────────────────────────────────────────────────────────
output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = aws_subnet.private[*].id
}

# ─── ALB ──────────────────────────────────────────────────────────────────
output "alb_dns_name" {
  description = "Your app URL — paste this in browser to access the app"
  value       = "http://${aws_lb.app.dns_name}"
}

# ─── RDS ──────────────────────────────────────────────────────────────────
output "rds_endpoint" {
  description = "RDS connection endpoint for your app"
  value       = aws_db_instance.mysql.endpoint
}

output "rds_port" {
  description = "RDS port"
  value       = aws_db_instance.mysql.port
}

# ─── AUTO SCALING GROUP ───────────────────────────────────────────────────
output "asg_name" {
  description = "Auto Scaling Group name"
  value       = aws_autoscaling_group.app.name
}

# ─── SNS ──────────────────────────────────────────────────────────────────
output "sns_topic_arn" {
  description = "SNS alerts topic ARN"
  value       = aws_sns_topic.alerts.arn
}

# ─── CLOUDWATCH DASHBOARD ─────────────────────────────────────────────────
output "cloudwatch_dashboard_url" {
  description = "CloudWatch dashboard URL"
  value       = "https://console.aws.amazon.com/cloudwatch/home?region=${var.aws_region}#dashboards:name=${var.project_name}-dashboard"
}
