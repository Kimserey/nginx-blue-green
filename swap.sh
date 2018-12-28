#!/usr/bin/env bash

set -u -e

ACTIVE=$(cat /mnt/c/Projects/nginx-bg/active) 

if [[ ${ACTIVE} == "blue" ]]; then
  SWAP=green
elif [[ ${ACTIVE} = "green" ]]; then
  SWAP=blue
else
    return 1
fi

ln -sf /etc/nginx/sites-available/${SWAP} /etc/nginx/sites-enabled/client
echo ${SWAP} > /mnt/c/Projects/nginx-bg/active
service nginx restart