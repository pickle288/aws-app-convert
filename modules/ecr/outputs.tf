output "arn" {
  description = "ARN du repository ECR"
  value       = module.ecr.repository_arn
  
}

output "repository_url" {
  description = "URL du repository ECR"
  value       = module.ecr.repository_url
}

output "repository_name" {
  description = "Nom du repository ECR"
  value       = module.ecr.repository_name
  
}

output "repositery_id" {
    description = "ID du repository ECR"
    value       = module.ecr.repository_id
  
}