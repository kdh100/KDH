import boto3

s3_client = boto3.client('s3', endpoint_url="https://vsa-00000004-kt-object-01.zadarazios.com")

def delete_bucket(bucket_name):
    s3_client.delete_bucket(Bucket=bucket_name)

delete_bucket(str(input("bucket name? : ")))