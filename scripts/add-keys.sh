#!/bin/bash

source "/vagrant/scripts/common.sh"

echo "Adding new private key"
cp -f $RES_SSH_KEYPAIRS/id_rsa${1} ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa

echo "Adding authorized keys"
cat $RES_SSH_KEYPAIRS/authorized_keys >> ~/.ssh/authorized_keys
cp -f $RES_SSH_CONFIG ~/.ssh