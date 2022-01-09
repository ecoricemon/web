#!/bin/sh

docker-compose up -d
tcpdump -i http-if port 8080 -vv -X -n -B 160000

