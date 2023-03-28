import boto3

s3 = boto3.resource('s3', endpoint_url="https://vsa-00000004-kt-object-01.zadarazios.com")

for bucket in s3.buckets.all():
    print(bucket.name)