#!bin/bash

vault secrets enable -path=ssh-client-signer ssh

vault write ssh-client-signer/config/ca generate_signing_key=true

vault read -field=public_key ssh-client-signer/config/ca > trusted-user-ca-keys.pem


echo <<EOF

Add this to each ssh server config -

# /etc/ssh/sshd_config
# ...
TrustedUserCAKeys /etc/ssh/trusted-user-ca-keys.pem

# Restart ssh
sudo systemctl restart ssh

EOF

vault write ssh-client-signer/roles/my-role -<<EOF
{
  "algorithm_signer": "rsa-sha2-256",
  "allow_user_certificates": true,
  "allowed_users": "alice,ubuntu",
  "allowed_extensions": "permit-pty,permit-port-forwarding",
  "default_extensions": [
    {
      "permit-pty": ""
    }
  ],
  "key_type": "ca",
  "default_user": "ubuntu",
  "ttl": "30m0s"
}
EOF


