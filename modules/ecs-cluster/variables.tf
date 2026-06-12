variable "ecr_repository_url" {
  description = "URL du repository ECR"
  type        = string
}

variable "target_group_arn" {
  description = "ARN du target group ALB"
  type        = string
}

variable "private_subnets" {
  description = "IDs des subnets privés pour les tasks"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "ID du SG de l'ALB"
  type        = string
}

variable "vpc_id" {
  description = "ID du VPC"
  type        = string
}