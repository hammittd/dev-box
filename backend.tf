terraform {
  backend "s3" {
    bucket         = "devbox-tfstate"
    key            = "terraform/devbox.tfstate"
    region         = "us-east-2"
    use_lockfile   = true
    encrypt        = true
  }
}
