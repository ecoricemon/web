import requests

response = requests.get(url='https://172.17.0.2:8080', verify='my-cert.crt')
print(response)

