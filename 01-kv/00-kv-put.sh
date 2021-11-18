#!/bin/bash -x 

# vault secrets enable -version=2 -path=secret kv

vault kv put secret/hello foo=world excited=yes

vault kv put secret/goodbye foo="cruel world" excited=no

vault kv put secret/jmartinson first=Jacob last=Martinson SSN=123-45-1877


