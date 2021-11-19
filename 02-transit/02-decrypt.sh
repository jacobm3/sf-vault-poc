#!/bin/bash

cleartext=$( vault write -format=json transit/decrypt/orders \
                   ciphertext="$(cat ciphertext)" \
           | jq -r .data.plaintext | base64 -d )

echo 
echo "Cleartext: $cleartext"
echo 

