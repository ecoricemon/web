import requests
import time

# Wait for starting the server
time.sleep(5)

# Try to connect the server
with requests.Session() as s:
	for _ in range(10):
		response = s.get(url='http://172.1.0.2:8080')
		print(response)
		response = s.get(url='http://172.1.0.2:8080')
		print(response)
		time.sleep(1)

