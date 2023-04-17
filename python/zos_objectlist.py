import boto3

s3_client = boto3.client('s3', endpoint_url="https://vsa-00000004-kt-object-01.zadarazios.com")

response = s3_client.list_objects(
    Bucket=str(input("Type bucketname to browse : "))
)

for item in response['Contents']:
    print(f'  {item["Key"]}')