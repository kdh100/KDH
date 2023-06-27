import time
import requests

token="gAAAAABkmcII4nWgWO7EwOt2-Wh6vwjJ9-Y7ZNQmIgu9Mwgmr8h24I_kNHSf9vUFdt_uZ5pE20KuVKePLMZcTaQjMWMBeo2tEUi2Oj69gUq0Va6sw_DavdYN5wJWuhQUSdynol1MmFsb9qCLXgof-liRZwixYcaB1YlbGV5_F99SbU8rXU3PA2A"
downloadURL="http://storage.gscdn.com/v1/AUTH_391eb629c4974ae59ff12b79ac78d760/ecpark12/metering_nimbus01_2023-02-23--05_49_25.zip"

counter=1
okCounter=0
errorCounter=0

headers = {
    'X-Auth-Token': token,
}

while counter > 0:
    t = time.localtime()
    ctime = time.strftime("%H:%M:%S", t)

    response = requests.get(downloadURL, headers=headers)
    if "200" in str(response):
        okCounter+=1
    else:
        errorCounter+=1

    log = ("(" + str(counter) + ") [" + ctime + "]" + str(response) + "\tok: " + str(okCounter) + "\terror: " + str(errorCounter) + "\n")
    with open('download.log', 'a+') as f:
        f.write(log)

    counter+=1
    time.sleep(3)