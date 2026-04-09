output "cluster_id" {
  value = aws_ecs_cluster.app-cluster.id
}

output "cluster_arn" {
  value = aws_ecs_cluster.app-cluster.arn
}

output "cluster_name" {
  value = aws_ecs_cluster.app-cluster.name
}