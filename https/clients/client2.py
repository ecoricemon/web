import requests
import time

# Wait for starting the server
time.sleep(5)

# Try to connect the server
server_cert = 'cert-server.crt'
my_cert = ('cert-client2.crt', 'cert-client2.key')
try:
	response = requests.get(url='https://172.1.0.2:8080', verify=server_cert, cert=my_cert)
except:
	response = 'Error'
print('Client2 received: ', response)

