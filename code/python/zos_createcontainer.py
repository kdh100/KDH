import boto3

s3_client = boto3.client('s3', endpoint_url="https://vsa-00000004-kt-object-01.zadarazios.com")

def create_bucket(bucket_name):
    s3_client.create_bucket(Bucket=bucket_name)

create_bucket(str(input("bucket name? : ")))