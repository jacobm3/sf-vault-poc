#!/bin/bash


vault secrets enable transit

vault write -f transit/keys/orders

vault write transit/encrypt/orders \
    plaintext=$(base64 <<< "4111 1111 1111 1111")

vault write -format=json transit/encrypt/orders \
    plaintext=$(base64 <<< "4111 1111 1111 1111") \
    | jq -r .data.ciphertext > ciphertext

