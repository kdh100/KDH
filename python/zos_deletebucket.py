import boto3
from objectindicator import ngos

s3_client = boto3.client('s3', endpoint_url=ngos)

def delete_bucket(bucket_name):
    s3_client.delete_bucket(Bucket=bucket_name)

delete_bucket(str(input("bucket name? : ")))