#!/bin/sh
if [ $# -eq 0 ]
	then
		echo "Usage > make-cert.sh [your password]"
		exit 0
fi

PW=$1
OUT_DIR=out
OUT_PREFIX=my-cert
KEY_PATH=$OUT_DIR/$OUT_PREFIX.key
CSR_PATH=$OUT_DIR/$OUT_PREFIX.csr
CRT_PATH=$OUT_DIR/$OUT_PREFIX.crt

# Clean
rm -f $KEY_PATH
rm -f $CSR_PATH
rm -f $CRT_PATH

# Generate output directory
mkdir -p $OUT_DIR

# Generate private key
openssl genrsa -aes256 -passout pass:$PW -out $KEY_PATH 2048

# Generate CSR
openssl req -new -config my-cert.cnf -key $KEY_PATH -passin pass:$PW -out $CSR_PATH

# Generate certificate
openssl x509 -req -days 36500 -in $CSR_PATH -signkey $KEY_PATH -passin pass:$PW -extfile my-cert.ext -out $CRT_PATH

# Clean
rm -f $CSR_PATH

