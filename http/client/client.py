import requests
import time

# Wait for starting the server
time.sleep(5)

# Try to connect the server
try:
	response = requests.get(url='http://172.1.0.2:8080')
	response = requests.get(url='http://172.1.0.2:8080')
except:
	response = 'Error'
print('Client1 received: ', response)

