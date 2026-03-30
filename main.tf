provider "aws" {
  region  = "eu-west-3"
  profile = "max"
}


#appelle vpc module
module "vpc" {
  source  = "./modules/vpc"
}