provider "aws" {
  region     = var.region
  skip_credentials_validation = true
  }

provider "aws" {
  alias = "europe"
  region = "eu-west-1"
  
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  tags = var.tags
  force_destroy = true
		  
}

resource "aws_s3_bucket" "s3_bucket-02" {
  bucket = var.bucket_name-02
  tags = var.tags
  force_destroy = true
  provider = aws.europe
		  
}

resource "aws_s3_bucket_ownership_controls" "s3_onwership" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_onwership]
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}


resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = var.s3versioning
  }
}