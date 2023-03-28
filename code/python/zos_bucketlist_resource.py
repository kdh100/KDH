import boto3

s3 = boto3.resource('s3', endpoint_url="https://vsa-00000004-kt-object-01.zadarazios.com")

'''
resource 는 상위 레벨, client 는 하위 레벨의 인터페이스로
resource 는 client 를 감싸고 있는 인터페이스라 대략적인 정보들은 불러올 수 있으나,
상세한 정보 혹은 모든 정보를 다 커버하진 못한다.
경우에 따라 client, resource 를 각각 사용해야 한다.
'''

for bucket in s3.buckets.all():
    print(bucket.name)