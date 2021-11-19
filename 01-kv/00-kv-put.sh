#!/bin/bash -x 

vault secrets enable -version=2 -path=secret kv

vault kv put secret/jmartinson first=Jacob last=Martinson SSN=123-45-1877

vault kv put secret/app1/db-conn-str str="mysql://user@db5.internal:3306?get-server-public-key=true" team="na-devops" environment="test"



