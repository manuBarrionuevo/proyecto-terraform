module "network" {
  source = "./modulos/network"

  tags           = {
    "owner"   = "Manuel"
    "cloud"   = "aws"
    "IAC"     = "terraform"
    "version" = "v1.6.6"
    "project" = "proyecto-terraform"
    "region"  = "Virginia"
  }
  cidr_block     = "172.1.0.0/16"
  subnet_public  = ["172.1.1.0/24", "172.1.2.0/24"]
  subnet_private = ["172.1.3.0/24", "172.1.4.0/24"]
}