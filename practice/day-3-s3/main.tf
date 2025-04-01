resource "aws_s3_bucket" "terraform_state" {
    bucket = var.bucket_name
}

resource "aws_dynamodb_table" "state-lock" {
    name =var.dynamoDB_table_name
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name="LockID"
      type="S"
    }  
  
}