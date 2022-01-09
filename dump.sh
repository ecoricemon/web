#!/bin/sh

tcpdump -i http-if port 8080 -vv -X -B 160000

