import boto3
from objectindicator import ngos

s3_client = boto3.client('s3', endpoint_url=ngos)

def delete_object(bucketname, objectname):
    s3_client.delete_object(
        Bucket=bucketname,
        Key=objectname
    )

bucketname = str(input("Type bucketname where target object exists : "))
objectname = str(input("Type objectname to remove : "))

delete_object(bucketname, objectname)