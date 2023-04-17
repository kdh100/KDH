import boto3

s3_client = boto3.client('s3', endpoint_url="https://vsa-00000004-kt-object-01.zadarazios.com")

def delete_object(bucketname, objectname):
    s3_client.delete_object(
        Bucket=bucketname,
        Key=objectname
    )

bucketname = str(input("Type bucketname where target object exists : "))
objectname = str(input("Type objectname to remove : "))

delete_object(bucketname, objectname)