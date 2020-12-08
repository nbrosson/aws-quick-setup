terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-west-3"
}


resource "aws_key_pair" "setup_key" {
  key_name   = "aws-key"
  public_key = file(var.key_pair_path["public_key_path"])
}
 

resource "aws_instance" "ubuntu_vm" {
   ami           = "ami-0d3f551818b21ed81"
   instance_type = "t2.micro"
   key_name      = "aws-key"
 }

 resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.ubuntu_vm.id
}