terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    } 
  }
}

provider "aws" {
  region     = var.region
  profile    = "admin"
}

module "security_group" {
  source = "./modules/security_group"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  
  ami              = "ami-0014ce3e52359afbd"
  instance_type    = "t3.micro"
  key_name         = "admin_key"
  volume_type      = var.volume_type
  volume_size      = var.volume_size
  instance_name    = var.instance_name
  
  sg_id            = module.security_group.sg_id
}
