#!/bin/bash

nonce=6219f28f-eb81-4dcf-bed9-7fd5a1f28f95

pkcs7=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/pkcs7 | tr -d '\n')

vault_login=$( vault write -format=json auth/aws/login role=dev-role \
  pkcs7=$pkcs7 \
  nonce=$nonce )

echo $vault_login
#token=$(echo $vault_login | jq -r 
