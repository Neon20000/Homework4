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


resource "aws_iam_role" "secret_manager_role" {
  name               = "secret_manager_role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::211125334864:user/admin" 
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_iam_policy_attachment" "secret_manager_attachment" {
  name       = "secret_manager_attachment"
  roles      = [aws_iam_role.secret_manager_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"  
}
module "security_group_1" {
  source = "./modules/security_group"
  name = "sg_2"
}
resource "aws_secretsmanager_secret" "my_test_secret" {
name = var.my_secret_name
}
// Generating random password
resource "random_password" "my_secret_password" {
length           = 8
special          = true
override_special = "!@#$*"//provide special symbols
}
// Adding random password  as a secret 
resource "aws_secretsmanager_secret_version" "my_test_secret_3_version" {
secret_id     = aws_secretsmanager_secret.my_test_secret.id
secret_string = random_password.my_secret_password.result
}





