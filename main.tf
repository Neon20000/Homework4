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

module "ec2_instance" {
  source = "./modules/ec2_instance"
  
  ami              = "ami-0014ce3e52359afbd"
  instance_type    = "t3.micro"
  key_name         = "admin_key"
  volume_type      = var.volume_type
  volume_size      = var.volume_size
  instance_name    = var.instance_name
}

module "security_group_1" {
  source = "./modules/security_group"
  name = "sg_2"
}



