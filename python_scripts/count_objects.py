import boto3

s3 = boto3.client('s3')

def count_objects_in_bucket(bucket_name):
    response = s3.list_objects_v2(Bucket=bucket_name)
    if 'Contents' in response:
        object_count = len(response['Contents'])
        print(f"Total number of objects in '{bucket_name}': {object_count}")
    else:
        print(f"No objects found in '{bucket_name}'.")

bucket_name = 'natwest-group-assignment'
count_objects_in_bucket(bucket_name)
