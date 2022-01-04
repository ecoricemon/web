#!/bin/sh

OUT_DIR=out
CN_SERVER=server
CN_CLIENT1=client1
CN_CLIENT2=client2
CN_STRANGER=stranger
MERGE_CRT_PATH=$OUT_DIR/clients.crt

# Generate output directory
mkdir -p $OUT_DIR

# Function to generate key path
get_path(){
	local sort=$1
	local file_name=cert-$2

	if [ $sort = "key" ]
	then
		echo "$OUT_DIR/$file_name.key"
	elif [ $sort = "csr" ]
	then
		echo "$OUT_DIR/$file_name.csr"
	elif [ $sort = "crt" ]
	then
		echo "$OUT_DIR/$file_name.crt"
	fi
}

# Function to generate certificate
make_cert(){
	local cn=$1
	local key_path=$(get_path key $cn)
	local csr_path=$(get_path csr $cn)
	local crt_path=$(get_path crt $cn)

	# Generate private key
	openssl genrsa -out $key_path 2048

	# Generate CSR
	openssl req -new -key $key_path -out $csr_path -subj "/C=KR/O=My organization/CN=www.$cn.com"

	# Generate certificate
	openssl x509 -req -days 36500 -in $csr_path -signkey $key_path -extfile my-cert.ext -out $crt_path
}

# Generate certificates
make_cert $CN_SERVER
make_cert $CN_CLIENT1
make_cert $CN_CLIENT2
make_cert $CN_STRANGER

# Make merged certificate
cat $(get_path crt $CN_CLIENT1) $(get_path crt $CN_CLIENT2) > $MERGE_CRT_PATH

# Copy crt and key to server and client directories
cp -f $(get_path key $CN_SERVER) ../server/
cp -f $(get_path crt $CN_SERVER) ../server/
cp -f $(get_path crt $CN_SERVER) ../clients/

cp -f $MERGE_CRT_PATH ../server/

cp -f $(get_path key $CN_CLIENT1) ../clients/
cp -f $(get_path crt $CN_CLIENT1) ../clients/

cp -f $(get_path key $CN_CLIENT2) ../clients/
cp -f $(get_path crt $CN_CLIENT2) ../clients/

cp -f $(get_path key $CN_STRANGER) ../clients/
cp -f $(get_path crt $CN_STRANGER) ../clients/

echo 'Done'

