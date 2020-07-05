variable "ami_id" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "PASTE_AMI_ID_HERE"
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "Instance type for instance"
  type        = string
  default     = "t2.micro"
}

variable "aws_key" {
  description = "Keypair name for Instance"
  type        = string
  default     = "PASTE_KEY_NAME_HERE"
}

variable "vpc_id" {
  description = "VPC Id for Security Group"
  type        = string
  default     = "PASTE_VPC_ID_HERE"
}
