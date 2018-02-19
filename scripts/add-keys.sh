#!/bin/bash

source "/vagrant/scripts/common.sh"

echo "Adding Authorized Keys"
cat $RES_SSH_KEYPAIRS/authorized_keys >> ~/.ssh/authorized_keys
cp -f $RES_SSH_CONFIG ~/.ssh