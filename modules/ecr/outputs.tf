output "arn" {
  description = "ARN du repository ECR"
  value       = aws_ecrpublic_repository.foo.arn
  
}

output "repository_url" {
  description = "URL du repository ECR"
  value       = aws_ecrpublic_repository.foo.repository_url
}

output "repository_name" {
  description = "Nom du repository ECR"
  value       = aws_ecrpublic_repository.foo.repository_name
  
}

output "repositery_id" {
    description = "ID du repository ECR"
    value       = aws_ecrpublic_repository.foo.repository_id
  
}