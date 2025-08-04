variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "ap-south-1"
}

variable "base_cidr_block" {
  description = "VPC CIDR"
  default     = "20.0.0.0/16"
}


variable "ami_image_name" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0d0ad8bb301edb745"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "security_group" {
    description = "The security group for the EC2 instance"
  type        = string
  default     = "sg-0373312c131eae60c"
}

variable "subnet_id" {
    description = "The subnet for the EC2 instance"
  type        = string
  default     = "subnet-0fe6cd54de73140bf"
}