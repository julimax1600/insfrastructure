terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "3.4"
    }
  }
}
provider "aws" {
  region     = "us-west-1"
  access_key = var.access_key_var
  secret_key = var.secret_key_var
}

resource "aws_s3_bucket" "bucketjim" {
  bucket = "my-tf-test-bucket-45"
  acl    = "bucket-owner-full-control"

  tags = {
    Name = "My bucket"
  }

  website {
    index_document = "index.html"
  }

}

  resource "aws_s3_bucket_object" "index" {
    bucket = aws_s3_bucket.bucketjim.id
    key    = "index.html"
    source = "web/index.html"
  }

