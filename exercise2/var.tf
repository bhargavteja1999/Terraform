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
  }
}