vault secrets enable pki

vault secrets tune -max-lease-ttl=87600h pki

vault write pki/root/generate/internal common_name=hashicorp.com ttl=87600h 

vault write pki/config/urls \
    issuing_certificates="http://vault.hashicorp.com:8200/v1/pki/ca" \
    crl_distribution_points="http://vault.hashicorp.com:8200/v1/pki/crl"

vault write pki/roles/db1.theneutral.zone \
    allowed_domains=db1.theneutral.zone \
    allow_bare_domains=true \
    allow_subdomains=true max_ttl=5m \
    key_bits=4096


vault write pki/issue/db1.theneutral.zone \
    common_name=db1.theneutral.zone


