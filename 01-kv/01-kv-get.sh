#!/bin/bash -x 
vault kv get secret/hello 
vault kv get secret/jmartinson 
vault kv get -format=json secret/hello 
