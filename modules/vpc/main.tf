module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"
 
  name = "vpc-prod"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-3a", "eu-west-3b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  single_nat_gateway = true
  enable_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true
  
  public_subnet_tags = {
    Name = "sub-public-prod"
  }
  
  private_subnet_tags = {
    Name = "sub-private-prod"
  }
}
