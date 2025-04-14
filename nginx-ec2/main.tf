# Use the default VPC
data "aws_vpc" "default" {
  default = true
}

# Create a Security Group
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
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
locals {
  html_content = file("${path.module}/index.html")
}
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

# Create EC2 instance (AWS Linux)
resource "aws_instance" "web_server" {
  ami                    = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl enable nginx
              systemctl start nginx
              echo "${local.html_content}" > /usr/share/nginx/html/index.html
              systemctl restart nginx
              EOF

  tags = {
    Name = "WebServer"
  }
}

