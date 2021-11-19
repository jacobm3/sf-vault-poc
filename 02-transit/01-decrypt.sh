#!/bin/bash

vault write transit/decrypt/orders \
    ciphertext="$(cat ciphertext)"

cleartext=$( vault write -format=json transit/decrypt/orders \
    ciphertext="$(cat ciphertext)" \
    | jq -r .data.plaintext | base64 -d )

echo 
echo "Cleartext: $cleartext"
echo 

