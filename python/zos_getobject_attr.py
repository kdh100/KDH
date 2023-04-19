import boto3

s3_client = boto3.client('s3', endpoint_url="https://vsa-00000004-kt-object-01.zadarazios.com")

def get_object_attributes(bucketname, objectname):
    s3_client.get_object_attributes(
        Bucket=bucketname,
        Key=objectname,
        ObjectAttributes=['ObjectSize']
)

bucketname = str(input("Type bucketname where target exists : "))
objectname = str(input("Type objectname to verifying attributes : "))

get_object_attributes(bucketname, objectname)