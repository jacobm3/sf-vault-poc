#!/bin/bash -x

VAULT_ADDR=https://demo-hcp-vault-cluster.private.vault.41dc07e4-601f-4ec5-bc56-6f2215c34bea.aws.hashicorp.cloud:8200
VAULT_NAMESPACE=admin

curl -s -H "X-Vault-Request: true" \
     -H "X-Vault-Namespace: $VAULT_NAMESPACE" \
     -H "X-Vault-Token: $(vault print token)" \
     $VAULT_ADDR/v1/pki/ca_chain

