resource "aws_dynamodb_table" "dynamodb" {
  name = "ankita-table"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}