import boto3
from objectindicator import ngos

s3_client = boto3.client('s3', endpoint_url=ngos)

def upload_file(filename, bucketname, objectname):
    s3_client.upload_file(
        Filename=filename,
        Bucket=bucketname,
        Key=objectname
    )

filename = str(input("Type filename with dir path to upload : "))
bucketname = str(input("Type bucketname to upload : "))
objectname = str(input("Type objectname to be uploaded : "))

upload_file(filename, bucketname, objectname)