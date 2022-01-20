#!/bin/bash

# Change to be whatever
FQDN="$1"

# make directories to work from
mkdir -p certs/{servers,tmp}

# Create Certificate for this domain,
mkdir -p "certs/servers/sales-se.d2iq.cloud"
openssl genrsa \
  -out "certs/servers/sales-se.d2iq.cloud/privkey.pem" \
  2048

# Create the CSR
openssl req -new \
  -key "certs/servers/sales-se.d2iq.cloud/privkey.pem" \
  -out "certs/tmp/sales-se.d2iq.cloud.csr.pem" \
  -subj "/C=US/ST=Utah/L=Provo/O=ACME Service/CN=sales-se.d2iq.cloud"
