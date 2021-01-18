terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "kandi-state"
    key    = "kandi-state"
  }
}

provider "aws" {
  region = "eu-west-1"
}

variable "dest_bucket_name" {
  type = "string"
}

variable "github_sha" {
  type = "string"
}

resource "aws_s3_bucket" "dest_bucket" {
  bucket = var.dest_bucket_name
  acl    = "private"
}

resource "aws_s3_bucket_object" "object" {
  bucket              = aws_s3_bucket.dest_bucket.id
  key                 = "kandi-${var.github_sha}.pdf"
  source              = "../src/main.pdf"
  acl                 = "public-read"
  content_disposition = "inline"
  depends_on          = ["aws_s3_bucket.dest_bucket"]
}
