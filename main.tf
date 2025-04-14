

module "lambda" {
    source = "./lambda"
    web_bucket_arn = module.website.web_bucket_arn
    web_bucket_id = module.website.web_bucket_id
}

module "website" {
    source = "./website"
}

module "nginx" {
    source = "./nginx-ec2"
}

output "website_address" {
    description = "The URL of the static website"
    value = module.website.website_url  
}

output "instance_public_ip" {
    description = "The public IP address of the EC2 instance"
    value = module.nginx.instance_public_ip
}