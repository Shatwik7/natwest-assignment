terraform {
  backend "s3" {
    bucket = "tf-versions"
    key    = "state-1"
    region = "us-east-1"
  }
}