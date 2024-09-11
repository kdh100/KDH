import boto3
from objectindicator import ngos

s3_client = boto3.client('s3', endpoint_url=ngos)

response = s3_client.list_objects(
    Bucket=str(input("Type bucketname to browse : "))
)

for item in response['Contents']:
    print(f'  {item["Key"]}')