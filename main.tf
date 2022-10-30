terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
  access_key = "AKIAWJLBBVE5OMXOAPMT"
  secret_key = "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"
  //assume_role {
  //role_arn     = "arn:aws:iam::432384616762:role/dev-user-role-101"
  //session_name = "SESSION_NAME"
  //external_id  = "ddubey-dev-user101"
  //}
}

variable "region" {
  default = "us-west-1"
  description = "AWS Region"
}

resource "aws_s3_bucket" "my" {
  bucket = "mytfebucket"
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.my.id
  acl    = "private"
}

/*
variable "ami" {
  default = "ami-00831fc7c1e3ddc60"
  description = "Amazon Machine Image ID for Ubuntu Server 20.04"
}

variable "type" {
  default = "t2.micro"
  description = "Size of VM"
}

resource "aws_instance" "demo" {
  ami = var.ami
  instance_type = var.type

  tags = {
    name = "Demo System"
  }
}*/
