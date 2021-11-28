#!/bin/bash -x

echo "Enabling database secrets engine"
vault secrets disable database
vault secrets enable database

echo "Writing db1 DB secrets engine config"
vault write database/config/db1 \
    plugin_name=mysql-database-plugin \
    connection_url="{{username}}:{{password}}@tcp(10.0.143.159:3306)/" \
    allowed_roles="db1-5s,db1-30s" \
    username="vaultroot" \
    password="FP4X0JUU8OU2GdOJhySC"

echo "Writing DB1 5s engine role" 
vault write database/roles/db1-5s \
    db_name=db1 \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON db1.* TO '{{name}}'@'%';" \
    default_ttl="5s" \
    max_ttl="5s"

echo "Writing DB1 30s engine role" 
vault write database/roles/db1-30s \
    db_name=db1 \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON db1.* TO '{{name}}'@'%';" \
    default_ttl="30s" \
    max_ttl="30s"

echo "Writing db1 policy"
vault policy write db1 -<<EOF
path "database/creds/db1-5s" {
  capabilities = ["read"]
}
path "database/creds/db1-30s" {
  capabilities = ["read"]
}
EOF


