import requests
import time

# Wait for starting the server
time.sleep(5)

# Try to connect the server
server_cert = 'cert-server.crt'
my_cert = ('cert-client1.crt', 'cert-client1.key')
try:
	response = requests.get(url='https://172.1.0.2:8080', verify=server_cert, cert=my_cert)
except:
	response = 'Error'
print('Client1 received: ', response)

