
output "website_url" {
  value = aws_s3_bucket.web_bucket.website_endpoint
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