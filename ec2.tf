# Security Group for EC2
resource "aws_security_group" "web_server" {
  name        = "web-server-sg"
  description = "Security group for web server"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP from anywhere"
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

  tags = {
    Name = "web-server-sg"
  }
}

# EC2 Instance
# Additional EC2 Instance - x2gd.medium
resource "aws_instance" "app_server" {
  ami                         = "ami-007020fd9c84e18c7"  # Ubuntu AMI
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  key_name                    = "aws-ec2-key" # replace with your key name
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.web_server.id]

  # Single root volume with 100GB
  root_block_device {
    volume_size           = 20  # Single 100GB volume for OS and Docker data
    volume_type           = "gp3"
    delete_on_termination = true
    tags = {
      Name = "app-server-volume"
    }
  }

  user_data = <<-EOF
            #!/bin/bash
            echo "Hello, World" > index.html
            nohup busybox httpd -f -p 80 &
            EOF

  tags = {
    Name = "app-server"
  }
} 