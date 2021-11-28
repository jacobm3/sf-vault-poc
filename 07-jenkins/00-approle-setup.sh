#!/bin/bash


vault auth disable approle
vault auth enable approle
vault write auth/approle/role/jenkins token_policies="rotate-my-secret-id,db1" \
    token_ttl=72h token_max_ttl=144h
vault read auth/approle/role/jenkins/role-id
vault write -force auth/approle/role/jenkins/secret-id

vault read auth/approle/role/jenkins

