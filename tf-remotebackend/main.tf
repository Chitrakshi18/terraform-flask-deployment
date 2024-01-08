resource "aws_s3_bucket" "tf-bucket" {
  bucket = "my-tf-state-storing-bucket"
  force_destroy = true
  tags = {
    Name        = "tf bucket to store state file"
  }
}
resource "aws_dynamodb_table" "terraform-dynamodb-tf-state-lock" {
  name           = "tf-dynamoDB-state-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
