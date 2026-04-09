resource "aws_ecs_cluster" "app-cluster" {
  name = "app-convert"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
