import boto3

s3_client = boto3.client('s3', endpoint_url="https://vsa-00000004-kt-object-01.zadarazios.com")

def download_file(filename, bucketname, objectname):
    s3_client.download_file(
        Filename=filename,
        Bucket=bucketname,
        Key=objectname
    )

filename = str(input("filename as downloaded : "))
bucketname = str(input("bucketname to download from : "))
objectname = str(input("objectname to be downloaded : "))

download_file(filename, bucketname, objectname)