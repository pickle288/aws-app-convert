
output "azs" {
description = "AZ utilisées"
value = module.vpc.azs
}

output "vpc_id" {
  description = "ID du vpc"
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "Bloc CIDR du vpc"
  value = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "IDs des subnets publics"
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "IDs des subnets privés"
  value = module.vpc.private_subnets
}