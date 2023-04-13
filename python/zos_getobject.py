import boto3

s3_client = boto3.client('s3', endpoint_url="https://vsa-00000004-kt-object-01.zadarazios.com")

def download_file(filename, bucketname, objectname):
    s3_client.download_file(
        Filename=filename,
        Bucket=bucketname,
        Key=objectname
    )

filename = str(input("Type filename to be stored including dir path : "))
bucketname = str(input("Type bucketname to downloading from : "))
objectname = str(input("Type objectname to download : "))

download_file(filename, bucketname, objectname)