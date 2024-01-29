# s3.tf
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-s3-awsd-demo01-asafiz"  # Change to a unique name

  #acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.s3_kms_key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = {
    Name = "my-s3-bucket"
  }
}

resource "aws_kms_key" "s3_kms_key" {
  description             = "KMS key for S3 bucket"
  deletion_window_in_days = 30
}
