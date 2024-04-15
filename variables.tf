variable "region" {
  description = "Region"
  type        = string
  default     = "eu-north-1"
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
variable "my_secret_name" {
  description = "Secret Name"
  type        = string
  default     = "my_test_secret"
}

