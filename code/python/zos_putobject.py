import boto3

s3_client = boto3.client('s3', endpoint_url="https://vsa-00000004-kt-object-01.zadarazios.com")

def upload_file(filename, bucketname, objectname):
    s3_client.upload_file(
        Filename=filename,
        Bucket=bucketname,
        Key=objectname
    )

filename = str(input("tpye filename with full direction : "))
bucketname = str(input("type bucketname to uploaded point : "))
objectname = str(input("type objectname to uploaded as be : "))

upload_file(filename, bucketname, objectname)