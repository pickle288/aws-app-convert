# faire aws sso login --profile "nom-local"

provider "aws" {
  region  = "eu-west-3"
  profile = "max"
}

module "vpc" {
  source = "./modules/vpc"
}

module "ecr" {
  source = "./modules/ecr"
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnet_ids
}

module "ecs" {
  source = "./modules/ecs-cluster"

  ecr_repository_url    = module.ecr.repository_url
  target_group_arn      = module.alb.alb_target_group_arn
  private_subnets       = module.vpc.private_subnet_ids
  alb_security_group_id = module.alb.alb_security_group_id
  vpc_id                = module.vpc.vpc_id
}