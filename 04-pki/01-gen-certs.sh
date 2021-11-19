#!/bin/bash -x 

vault write pki/issue/db1.theneutral.zone \
    common_name=db1.theneutral.zone \
    format=pem_bundle > db1.theneutral.zone

