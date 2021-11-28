vault auth enable aws
vault write auth/aws/role/dev-role \
  auth_type=ec2 \
  bound_ami_id=ami-022d4249382309a48 \
  policies=db1 \
  max_ttl=2h
