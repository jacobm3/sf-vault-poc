#!/bin/bash

connstring=$( curl -s -H "X-Vault-Request: true" \
                   -H "X-Vault-Namespace: admin/" \
                   -H "X-Vault-Token: $(vault print token)" \
           https://demo-hcp-vault-cluster.private.vault.41dc07e4-601f-4ec5-bc56-6f2215c34bea.aws.hashicorp.cloud:8200/v1/secret/data/app1/db-conn-str \
           | jq -r .data.data.str )

echo
echo Connection String: $connstring
echo

