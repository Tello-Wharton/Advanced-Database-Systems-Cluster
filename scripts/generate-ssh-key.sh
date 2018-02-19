#!/bin/bash

source "/vagrant/scripts/common.sh"

echo "Generating SSH Keys"
ssh-keygen -t rsa -P "" -f $RES_SSH_KEYPAIRS/id_rsa${1}
cat $RES_SSH_KEYPAIRS/id_rsa${1}.pub >> $RES_SSH_KEYPAIRS/authorized_keys