#ec2 instance
resource "aws_instance" "webserver" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.allow_http.name]
  user_data_replace_on_change = var.user_data_replace
  
  tags = {
    Name = "webserver"
  }
}


#ec2 security group allowing http
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"


  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }


}