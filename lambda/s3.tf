resource "aws_s3_bucket" "lambda_bucket" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name = "LambdaCodeBucket"
  }
}

resource "aws_s3_object" "lambda_zip" {
  bucket = aws_s3_bucket.lambda_bucket.id
  key    = "lambda/my_lambda.zip"
  source = "my_lambda.zip"
  etag   = filemd5("my_lambda.zip")
}