variable "ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0014ce3e52359afbd"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "admin_key"
}

variable "volume_size" {
  description = "Volume Size"
  type        = number
  default     = 10
}
variable "volume_type" {
  description = "Volume Type"
  type        = string
  default     = "gp2"
}
variable "instance_name" {
  description = "Instanse Name"
  type        = string
  default     = "module_instance"
}

variable "sg_name" {
  description = "SG Name"
  type        = string
  default     = "sg_name"
}

variable "instance_number" {
  description = "Instanse number"
  type        = number
  default     = 1
}