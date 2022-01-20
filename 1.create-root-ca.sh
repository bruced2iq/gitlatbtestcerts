#!/bin/bash

FQDN="$1"

# make directories to work from
mkdir -p certs/ca

# Create your very own Root Certificate Authority
openssl genrsa \
  -out certs/ca/sales-se.d2iq.cloud.key.pem \
  2048

# Self-sign your Root Certificate Authority
# Since this is private, the details can be as bogus as you like
openssl req \
  -x509 \
  -new \
  -nodes \
  -key certs/ca/sales-se.d2iq.cloud.key.pem \
  -days 9131 \
  -out certs/ca/sales-se.d2iq.cloud.crt.pem \
  -subj "/C=US/ST=Utah/L=Provo/O=ACME Signing Authority Inc/CN=sales-se.d2iq.cloud"
