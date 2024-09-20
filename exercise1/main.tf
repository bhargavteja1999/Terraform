# Create a Key Pair
module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = "deployer-2025"
  create_private_key = true
}

# Create a Security Group
resource "aws_security_group" "my_sg" {
  name        = "my25azure-security-group"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-security-group"
  }
}

# Create an EC2 Instance
resource "aws_instance" "my_instance" {
  ami                         = "ami-0e86e20dae9224db8"  # Replace with your desired AMI ID
  instance_type               = "t2.micro"  # Instance type
  key_name                    = "deployer-2025"  # Use the key name directly since it was provided in the module
  vpc_security_group_ids      = [aws_security_group.my_sg.id]  # Attach the security group
  associate_public_ip_address = true

  tags = {
    Name = "azure25-ec2-instance"
  }
}

terraform {
  backend "s3" {
    bucket = "terraform20246767"
    key    = "terraform/remote"
    region = "us-east-1"
  }
}


