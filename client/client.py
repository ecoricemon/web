import requests
import time

# Wait for starting the server
time.sleep(5)

# Try to connect the server
response = requests.get(url='https://172.1.0.2:8080', verify='cert-my-server.crt')
print(response)

