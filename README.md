# Cloud Assignment

## Task 1: AWS 

### 1. Create an S3 Bucket
- Create an Amazon S3 bucket with a unique name.
- Configure the bucket to be publicly accessible for static website hosting.
- Document the steps taken to create the S3 bucket.

### 2. Set Up an EC2 Instance
- Launch an Amazon EC2 instance using Amazon Linux.
- SSH into the instance and install a web server of your choice (e.g., Apache or Nginx).
- Create a simple HTML page and host it on the web server.
- Provide the public IP address of your EC2 instance or private link endpoint.

### 3. Configure Security Group
- Modify the security group of your EC2 instance to allow HTTP traffic.
- Restrict access to your public IP only.

### 4. AWS Lambda Function
- Write an AWS Lambda function using Python that:
    - Triggers on an S3 bucket event (e.g., object creation).
    - Logs the event details to CloudWatch Logs.

## Task 2: Scripting

### 5. Python Script
- Write a Python script that interacts with the AWS SDK (boto3) from the EC2 instance:
    - List all S3 buckets in your AWS account.
    - Display the total number of objects in a specified S3 bucket.
- Develop a Python script to analyze a given CSV file (format: `name, age, grade`) and print the names of students with an average grade above a specified threshold.

### 6. AWS SDK Documentation Review
- Include links to the specific documentation pages consulted for Task 2.

## Task 3: CI/CD Basics

### 7. Setup a GitHub Repository
- Create a GitHub repository to host:
    - The web server script from Task 2.5 (either Bash or Python).
    - The Terraform script from Task 4.9.
- Share the link to your GitHub repository.

### 8. Implement a Simple CI/CD Pipeline
- Use GitHub Actions or any CI/CD tool of your choice to set up a pipeline for the GitHub repository.

## Task 4: Infrastructure as Code (IaC) with Terraform

### 9. Terraform Script
- Write a Terraform script to:
    - Automate the creation of the EC2 instance and associated resources.
    - Create an Amazon S3 bucket for storing static website content.
    - Parameterize the script for variables like instance type, key pair, bucket name, etc.

### 10. AWS Lambda Function
- Integrate the Lambda function from Task 1.4 into the Terraform script from Task 9 for automatic deployment.

### 11. Cost Estimation
- Provide the annual AWS cost of the setup completed in Task 1.



