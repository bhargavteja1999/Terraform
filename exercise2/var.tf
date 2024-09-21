variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "INSTANCE" {
  default = "t2.micro"
}

variable "KEYNAME" {
  default = "sample"
}

variable "SUBNET" {
  default = "subnet-01436b854bbd99fd4"
}



variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0e86e20dae9224db8"
    us-east-2 = "ami-085f9c64a9b75eed5"
    us-west-1 = "ami-0d53d72369335a9d6"
    us-west-2 = "ami-08d8ac128e0a1b91c"
  }
}
