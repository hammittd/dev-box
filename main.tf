terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      version = "~> 4.54"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_key_pair" "dev_key" {
  key_name   = "dev-key"
  public_key = var.ssh_pub_key
}

resource "aws_security_group" "dev_sg" {
  name        = "dev-sg"
  description = "Tailscale-only access"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "dev_box" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.dev_key.key_name
  vpc_security_group_ids = [aws_security_group.dev_sg.id]

  user_data = templatefile("cloud-init.yaml.tpl", {
    tailscale_auth_key = var.tailscale_auth_key
  })

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "DevBox"
  }
}
