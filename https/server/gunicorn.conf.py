import ssl

wsgi_app = 'server:app'
bind = '0.0.0.0:8080'
workers = 1
keyfile = 'cert-server.key'
certfile = 'cert-server.crt'
cert_reqs = ssl.VerifyMode.CERT_REQUIRED
ca_certs = 'clients.crt'
loglevel = 'debug'

