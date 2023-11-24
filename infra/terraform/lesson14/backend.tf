resource "aws_s3_bucket" "backend" {
  bucket = var.backend_bucket_name

  tags = {
    Name        = "levelup"
    Environment = "Dev"
  }
}

resource "aws_dynamodb_table" "lock" {
  name             = "levelup-backend-lock"
  hash_key         = "LockID"
  write_capacity     = 10 
  read_capacity      = 10

  attribute {
    name = "LockID"
    type = "S"
  }
}