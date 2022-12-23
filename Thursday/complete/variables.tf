#ec2 instance 
variable "instance_type" {
  type        = string
  description = "AMI ID for our webserver"
  default     = "t2.micro"
}

variable "ami_id" {
    default = "ami-0b5eea76982371e91"
}

variable "user_data_replace" {
    default = true
}

#webserver security group
variable "cidr_blocks" {
    default = ["10.0.0.0/16"]
}