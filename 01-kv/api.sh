#!/bin/bash

connstring=$( curl -s -H "X-Vault-Namespace: admin/" \
                      -H "X-Vault-Token: $(vault print token)" \
                     $VAULT_ADDR/v1/secret/data/app1/db-conn-str \
            | jq -r .data.data.str )

echo
echo Connection String: $connstring
echo

