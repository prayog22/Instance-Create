# main.tf - Main Terraform configuration file

provider "aws" {
  region = var.region
}

# Create Security Group for Apache
resource "aws_security_group" "apache" {
  name        = "apache-sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "apache-security-group"
  }
}

# Create EC2 instance with Apache installed via user data
resource "aws_instance" "apache_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.default.id
  vpc_security_group_ids = [aws_security_group.apache.id]
  key_name               = var.key_name

  user_data = file("${path.module}/scripts/userdata.sh")

  tags = {
    Name = var.instance_name
  }
}