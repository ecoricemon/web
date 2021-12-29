from flask import Flask
import ssl

app = Flask(__name__)

@app.route('/')
def index():
	return '<h1>hi</h1>'

def main():
	ssl_ctx = ssl.SSLContext(ssl.PROTOCOL_TLS)
	ssl_ctx.load_cert_chain(certfile='my-cert.crt', keyfile='my-cert.key')
	app.run(host='0.0.0.0', port=8080, ssl_context=ssl_ctx)

if __name__ == '__main__':
	main()

