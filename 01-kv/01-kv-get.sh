#!/bin/bash -x 
vault kv get secret/jmartinson 

vault kv get secret/app1/db-conn-str 

vault kv get -format=json secret/app1/db-conn-str 

vault kv get -output-curl-string secret/app1/db-conn-str



