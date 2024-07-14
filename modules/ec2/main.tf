resource "aws_instance" "webserver" {
  ami           = var.ami
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = var.subnet_id

  tags = {
    Name = "WebServer"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<html><h1>Welcome to Terraform Demo</h1></html>" > /var/www/html/index.html
              EOF
}

resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg"
  vpc_id      = var.vpc_id

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