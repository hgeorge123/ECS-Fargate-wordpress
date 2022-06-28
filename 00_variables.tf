variable "pj_name" {
  type = map
  default = {
    name   = "crochetisimo"
  }
}

variable "common-AZ" {
  type = map
  default = {
    region = "us-east-1"
    az-1   = "us-east-1a"
    az-2   = "us-east-1b"
  }
}

variable "vpc" {
  type = map
  default = {
    cidr-block = "10.0.0.0/24"
  }
}

variable "rds-dbname-1" {
  type = map
  default = {
    dbname   = "crochetisimo"
  }
}

variable "rds-user-1" {
  type = map
  default = {
    user   = "wpuser"
  }
}

data "aws_caller_identity" "self" { }
data "aws_region" "current" {}
