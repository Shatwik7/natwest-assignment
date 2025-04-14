variable "aws_region" {
  description = "The AWS region where the S3 bucket will be created"
  type        = string
  default     = "us-east-1"
}
output "website_url" {
  value = "http://${aws_s3_bucket.web_bucket.bucket}.s3-website-${var.aws_region}.amazonaws.com"
  description = "The URL of the static website"
}

output "web_bucket_arn" {
  value = aws_s3_bucket.web_bucket.arn
  description = "The ARN of the S3 bucket"
}

output "web_bucket_id" {
  value = aws_s3_bucket.web_bucket.id
  description = "The ID of the S3 bucket"
}