#!/bin/bash

FQDN="$1"

echo ""

echo "PRIVATE server bundle: certs/servers/${FQDN}/server.pem"
echo "(keep it secret, keep it safe - just like privkey.pem)"
echo ""
echo ""
cat \
  "certs/servers/${FQDN}/privkey.pem" \
  "certs/servers/${FQDN}/cert.pem" \
  > "certs/servers/${FQDN}/server.pem"


echo "chain: certs/servers/${FQDN}/chain.pem"
echo "(contains Intermediates and Root CA in least-authoritative first manner)"
echo ""
echo ""
# if there were an intermediate, it would be concatonated before the Root CA
cat \
  "certs/ca/my-root-ca.crt.pem" \
  > "certs/servers/${FQDN}/chain.pem"


# TODO
#
# The Convention for Full Chain is one of these:
#   root + intermediates + cert
#   root + intermediates
#   intermediates + cert
#
# ... but I don't remember which
# I may be wrong about chain as well...

echo "fullchain: certs/servers/${FQDN}/fullchain.pem"
echo "(contains Server CERT, Intermediates and Root CA)"
echo ""
echo ""
cat \
  "certs/servers/${FQDN}/cert.pem" \
  "certs/ca/my-root-ca.crt.pem" \
  > "certs/servers/${FQDN}/fullchain.pem"

echo "All Done"
