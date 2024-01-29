resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-s3-aws-demo01-asafiz"
  #acl    = "private"
}

resource "aws_kms_key" "s3_kms_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_kms_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}