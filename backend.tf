terraform {
  backend "s3" {
    bucket = "myterraform25032025"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}