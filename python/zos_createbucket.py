import boto3
from objectindicator import ngos

s3_client = boto3.client('s3', endpoint_url=ngos)

def create_bucket(bucket_name):
    s3_client.create_bucket(Bucket=bucket_name)

create_bucket(str(input("bucket name? : ")))