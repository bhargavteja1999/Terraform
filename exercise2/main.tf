module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  ami                    = var.AMIS[var.REGION]
  instance_type          = var.INSTANCE
  key_name               = var.KEYNAME
  monitoring             = true
  vpc_security_group_ids = ["sg-082c807074e9eaa4f"]
  subnet_id              = var.SUBNET

  tags = {
    Terraform   = "true"
    Environment = "dev"
    name        = "variable"
  }
}

terraform {
  backend "s3" {
    bucket = "azuredevops34343"
    key    = "terraform/remote"
    region = "us-east-1"
  }
}