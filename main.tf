#faire aws sso login --profile "nom-local"


provider "aws" {
  region  = "eu-west-3"
  profile = "max"
}


#appelle vpc module
module "vpc" {
  source  = "./modules/vpc"
}

module "ecr" {
  source = "./modules/ecr"
}

module "ecs" {
  source = "./modules/ecs-cluster"
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnet_ids
}