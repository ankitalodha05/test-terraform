terraform {
  backend "s3" {
    bucket         = "anki1042025"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamodb-table"
    encrypt        = true

  }
}