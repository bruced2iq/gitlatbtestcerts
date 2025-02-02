#!/bin/bash

FQDN="sales-se.d2iq.cloud"

# Sign the request from Server with your Root CA
openssl x509 \
  -req -in certs/tmp/${FQDN}.csr.pem \
  -CA certs/ca/${FQDN}.crt.pem \
  -CAkey certs/ca/${FQDN}.key.pem \
  -CAcreateserial \
  -out certs/servers/${FQDN}/cert.pem \
  -days 9131
