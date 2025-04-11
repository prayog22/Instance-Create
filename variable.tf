# variables.tf - Variable definitions

variable "region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
  default     = "Tools"
}

variable "instance_name" {
  description = "The name to assign to the EC2 instance"
  type        = string
  default     = "apache-server"
}