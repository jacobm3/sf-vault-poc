#!/bin/bash 

set -e

# Web server config
CERT_FILE=/etc/ssl/private/db1.theneutral.zone.crt
KEY_FILE=/etc/ssl/private/db1.theneutral.zone.key
WEB_CN=db1.theneutral.zone


# Vault Connectivity
export VAULT_ADDR=https://demo-hcp-vault-cluster.private.vault.41dc07e4-601f-4ec5-bc56-6f2215c34bea.aws.hashicorp.cloud:8200
export VAULT_NAMESPACE=admin
export VAULT_TOKEN=$(cat ~/.vault-token)

echo
echo -n "NEW RUN: "
date

before=$(echo "Before:"; sudo openssl x509 -in $CERT_FILE -text | egrep -A1 Serial)

echo "Retrieving new certificate and private key from Vault"
json=$( vault write -format=json \
          pki/issue/$WEB_CN \
          common_name=$WEB_CN \
          format=pem)

echo "Writing new certificate to: $CERT_FILE"
echo $json | jq .data.certificate  | sed 's/\\n/\n/g' | sed 's/"//g' | sudo tee $CERT_FILE >/dev/null

echo "Writing new private key to: $KEY_FILE"
echo $json | jq .data.private_key  | sed 's/\\n/\n/g' | sed 's/"//g' | sudo tee $KEY_FILE >/dev/null

echo
echo $before
echo
echo -n "After: Serial Number: "
echo $json | jq -C .data.serial_number

echo
echo "nginx restart"
echo
sudo systemctl restart nginx

sleep 3

echo "Scrubbing private key from $KEY_FILE"
sudo scrub -r $KEY_FILE
