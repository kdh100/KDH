import boto3

s3_client = boto3.client('s3', endpoint_url="https://vsa-00000004-kt-object-01.zadarazios.com")

def upload_file(filename, bucketname, objectname):
    s3_client.upload_file(
        Filename=filename,
        Bucket=bucketname,
        Key=objectname
    )

filename = str(input("filename with full direction to upload for : "))
bucketname = str(input("bucketname which be uploaded to : "))
objectname = str(input("objectname as uploaded : "))

upload_file(filename, bucketname, objectname)