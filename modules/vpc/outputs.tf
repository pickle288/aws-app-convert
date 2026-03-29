#exemple de bloc de code pour les outputs
#output "vpc_id" {
#  value = module.vpc.vpc_id

output "azs" {
description = "AZ utilisées"
value = module.vpc.azs
}

output "vpc_id" {
  description = "ID du vpc"
  value = module.vpc.default_vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "IDs des subnets publics"
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs des subnets privés"
  value = module.vpc.private_subnet_ids
}