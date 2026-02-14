module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"

  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_app_subnets = [
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]

  private_db_subnets = [
    "10.0.5.0/24",
    "10.0.6.0/24"
  ]

  azs = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}


module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = "dev-eks-cluster"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_app_subnets
  eks_sg_id       = module.security.eks_sg_id
}

module "rds" {
  source = "./modules/rds"

  db_name             = "appdb"
  db_username         = "admin"
  db_password         = "StrongPassword123"   # Later we move this to Secrets Manager
  private_db_subnets  = module.vpc.private_db_subnets
  rds_sg_id           = module.security.rds_sg_id
}