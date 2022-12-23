#ec2 instance with webserver
resource "aws_instance" "webserver" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t3.micro"
  security_groups = [aws_security_group.allow_http.id]

  tags = {
    Name = "HelloWorld"
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
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }


}