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
