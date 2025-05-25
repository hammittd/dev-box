variable "aws_region" {
  description = "AWS region to deploy to"
  default     = "us-east-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.small"
}

variable "ssh_pub_key" {
  description = "Your public SSH key"
  type        = string
}

variable "tailscale_auth_key" {
  description = "Tailscale auth key"
  type        = string
  sensitive   = true
}
