provider "aws" {
  region  = local.region
  profile  = local.profile
}

resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair"
  public_key = file("${var.PATH_TO_PUBLIC_KEY}")
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  connection {
    # The default username for our AMI
    user        = "ubuntu"
    type        = "ssh"
    private_key = file("${var.PATH_TO_PRIVATE_KEY}")
  }

  tags = {
    "Env" = "${terraform.workspace}"
  }
}

resource "aws_s3_bucket" "dev4" {
  bucket = "loliveira-dev4"
  acl    = "private"

  tags = {
    Name = "loliveira-dev4"
  }
}

resource "aws_dynamodb_table" "dynamodb-dev" {
  name         = "GameScores"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "UserId"
  range_key    = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}