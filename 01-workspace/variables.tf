variable "aws_profile" {
  type        = string
  description = "AWS Profile"
  default     = "awsterraform"
}

variable "aws_region" {
  type        = map(string)
  description = "AWS region"
  default     = {
    "default"    = "us-east-1"
    "sandbox"    = "us-east-1"
    "production"  = "sa-east-1"
  }
}

variable "environment" {
  type        = map(string)
  description = ""
  default     = {
    "default"    = "Este é o ambiente padrão"
    "sandbox"    = "Este é o ambiente sandbox"
    "production" = "Este é o ambiente produção"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  type        = string
  description = ""
  default     = "./mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  type        = string
  description = ""
  default     = "./mykey.pub"
}

variable "ami_id" {
  type        = string
  description = "AMI ID to use"
  default     = "ami-09e67e426f25ce0d7"
}

variable "instance_type" {
  type        = string
  description = "Instance type to use"
  default     = "t2.micro"

}
