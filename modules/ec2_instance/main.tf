module "security_group" {
  source = "../security_group"  # Шлях до вашого модулю безпеки
}
resource "aws_instance" "module_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [module.security_group.sg_id]

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }

  tags = {
    Name = var.instance_name
  }
}
