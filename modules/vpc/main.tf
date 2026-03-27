//partie VPC
module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "6.6.0"
    name = "vpc-prod"
    cidr = "10.0.0.0/16"
    azs             = ["eu-west-3a", "eu-west-3b"]

    single_nat_gateway = true #pour éviter d'avoir plusieurs NAT Gateway par az

    }
resource "aws_subnet" "public" {
  count = 2
  vpc_id = module.vpc.vpc_id
  cidr_block = "10.10.3.0/24"
  availability_zone = element(module.vpc.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index}"
  }
}
