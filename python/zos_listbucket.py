import boto3

s3_client = boto3.client('s3', endpoint_url="https://vsa-00000004-kt-object-01.zadarazios.com")
response = s3_client.list_buckets()

''' API 호출 결과값을 전체 출력 '''
#print(response)

'''
AWS S3SDK(boto3) 가이드 예문이다.

API 호출값은 사전 형태의 데이터로, for 문을 통해 특정 Key 값을 기준을 잡았다.

{"Buckets":{"Name":"Value"}, ...} 형태로 자료가 저장되어 있어,
Name 에 해당되는 Value 를 가져오기 위해 for 문의 인자값인 bucket 을 통해
내부에 존재하는 Name 에 매칭되는 Value 를 불러오려는 코드로 해석된다.

print 내부에 f-string 은 출력 포맷을 일정하게 맞춰주기 위한 값으로,
아래에서처럼 f'  (내용)' 공백을 넣어 공백까지 모든 출력 포맷을 맞춰준 것으로 보인다.
'''

print('Existing Buckets')
for bucket in response['Buckets']:
    print(f'  {bucket["Name"]}')