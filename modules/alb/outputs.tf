output "alb_arn" {
  description = "ARN de l'ALB"
  value       = aws_alb.alb-prod.arn
}
output "alb_dns_name" {
  description = "DNS name de l'ALB"
  value       = aws_alb.alb-prod.dns_name
}

output "alb_target_group_arn" {
  description = "ARN du target group de l'ALB"
  value       = aws_alb_target_group.alb-tg-prod.arn
}

output "listener_arn" {
  description = "ARN du listener de l'ALB"
  value       = aws_lb_listener.alb-listener-prod.arn
  
}

output "alb_security_group_id" {
  description = "ID du groupe de sécurité de l'ALB"
  value       = aws_security_group.sg-alb.id
  
}
output "alb_security_group_name" {
  description = "Nom du groupe de sécurité de l'ALB"
  value       = aws_security_group.sg-alb.name
  
}