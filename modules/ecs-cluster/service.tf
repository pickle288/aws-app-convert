# Security group pour les tasks ECS
resource "aws_security_group" "sg-ecs-tasks" {
  name        = "sg-ecs-tasks"
  description = "Security group pour les tasks ECS app-convert"
  vpc_id      = var.vpc_id

  # Autorise uniquement le trafic venant de l'ALB sur le port 8080
  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [var.alb_security_group_id]
  }

  # Sortie libre (pull image ECR, appels API AWS)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Service ECS
resource "aws_ecs_service" "app-convert" {
  name            = "app-convert"
  cluster         = aws_ecs_cluster.app-cluster.id
  task_definition = aws_ecs_task_definition.app-convert.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnets    # tasks dans les subnets privés
    security_groups  = [aws_security_group.sg-ecs-tasks.id]
    assign_public_ip = false                  # pas d'IP publique, l'ALB fait le relais
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "app-convert"
    container_port   = 8080
  }

  depends_on = [aws_iam_role_policy_attachment.ecs_task_execution_policy]
}