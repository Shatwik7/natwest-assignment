
# ☁️ AWS Cloud Computing Assignment

---

## Task 1: AWS

### 📦 1. Create an S3 Bucket

🎯 **Objective**:
- Create an Amazon S3 bucket
- Enable static website hosting
- Make it publicly accessible

✅ **Steps**:
1. Opened AWS console and navigated to **S3**
3. Entered a unique bucket name ->natwest-group-assignment
4. Chose region `ap-south-1`
5. Unchecked "Block all public access"
6. Used default encryption setting
8. Enabled **Static Website Hosting**
9. Uploaded a sample `index.html` file with message
10. Granted public access using a bucket policy to allow `s3:GetObject`
11. Accessed the static website at:  
   **🔗** [http://natwest-group-assignment.s3-website.ap-south-1.amazonaws.com/](http://natwest-group-assignment.s3-website.ap-south-1.amazonaws.com/)

---

### 💻 2. Set Up an EC2 Instance

🎯 **Objective**:
- Launch an EC2 instance and set up a web server

✅ **Steps**:

1. **Launch EC2 Instance**
   - Name: `WebServerInstance`
   - AMI: `Amazon Linux 2023`
   - Instance Type: `t2.micro`
   - Key Pair: Selected or created new
   - Network Settings:
     - Allow SSH (22) from **My IP**
     - Allow HTTP (80) from **My IP**

2. **Connect via SSH**
   ```bash
   ssh -i "my-key.pem" ec2-user@<EC2_PUBLIC_IP>
   ```

3. **Install Apache Web Server**
   ```bash
   sudo yum update -y
   sudo yum install httpd -y
   sudo systemctl start httpd
   sudo systemctl enable httpd
   ```

4. **Create an HTML page** using `nano` and paste content.

5. **Restart server**
   ```bash
   sudo systemctl restart httpd
   ```

6. **Access the web page:**
   **🔗** [http://ec2-3-110-189-57.ap-south-1.compute.amazonaws.com/](http://ec2-3-110-189-57.ap-south-1.compute.amazonaws.com/)

---

### 🔐 3. Configure Security Group

🎯 **Objective**:
- Allow only specific IPs (your own) to access HTTP and SSH

✅ **Steps**:
1. Selected the instance → Under **Security**, clicked **Security Group**
2. Edited **Inbound Rules**
   - **Rule 1**:
     - Type: SSH
     - Port: 22
     - Source: My IP
   - **Rule 2**:
     - Type: HTTP
     - Port: 80
     - Source: My IP
3. Saved the rules

---

### ⚙️ 4. AWS Lambda Function

🎯 **Objective**:
- Trigger Lambda on S3 object creation
- Log event details to CloudWatch Logs

✅ **Steps**:

#### A. Create Lambda Function
1. Go to AWS Lambda Console
2. Create Function:
   - Name: `LogS3Event`
   - Runtime: Python 3.12
   - Role: Use existing (`LambdaS3LoggingRole`)
3. Replaced default code with:

```python
import json

def lambda_handler(event, context):
    print("Received S3 Event:")
    print(json.dumps(event, indent=2))
    
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        print(f"New object uploaded: {key} in bucket: {bucket}")

    return {
        'statusCode': 200,
        'body': json.dumps('Event logged successfully!')
    }
```

4. Deployed the function

#### B. Configure S3 Trigger
- Name: `LogUploadEvents`
- Event Type: `PUT (ObjectCreated)`
- Destination: Lambda
- Function: `LogS3Event`

✅ Now, every object upload logs to **CloudWatch Logs**

---

## Task 2: Scripting

### 🐍 5. Python Code

-In Python_scipt folder

📦 **requirements.txt** includes:
```txt
boto3
pandas
```

---

### 📚 6. SDK Documentation

- Boto3 Docs: [https://boto3.amazonaws.com/v1/documentation/api/latest/index.html](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)
- Pandas Docs: [https://pandas.pydata.org/](https://pandas.pydata.org/)

---

## Task 3: CI/CD

### ⚙️ 7. GitLab CI/CD

✅ Used **GitLab CI/CD** for automation

- CI/CD file: `.gitlab-ci.yml`
- Automatically installs dependencies, runs Python scripts and Terraform plan

---

## Task 4: Infrastructure as Code (IaC)

### 🏗️ 9 & 10. Terraform Code

✅ Terraform scripts are present in the `terraform/` folder in the repo.

- Provisions:
  - EC2 instance and configurtes security group
  - S3 bucket with website hosting
  - IAM role and Lambda integration
  - S3 → Lambda trigger on object creation

---

### 💰 11. Cost Estimation

| Service          | Usage                        | Monthly Cost | Annual Cost |
|------------------|------------------------------|--------------|-------------|
| S3 (Static Site) | < 5GB storage                | $0.00        | $0.00       |
| EC2 (t2.micro)   | 750 hours/mo (free tier)     | $0.00        | $0.00       |
| Lambda           | 1M calls/mo (low usage)      | $0.00        | $0.00       |

**🧮 Estimated Total Cost: $0/year (within AWS Free Tier)**

---
