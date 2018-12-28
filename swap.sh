#!/usr/bin/env bash

set -ue

ACTIVE=$(cat /mnt/c/Projects/nginx-bg/active) 

if [[ ${ACTIVE} == "blue" ]]; then
  SWAP=green
elif [[ ${ACTIVE} = "green" ]]; then
  SWAP=blue
else
  echo ERROR: Failed to recognize ACTIVE instance.
  echo Verify that \"active\" configuration exists and that the configuration is either \"blue\"" or \"green\"".
  exit 1
fi

ln -sf /etc/nginx/sites-available/${SWAP} /etc/nginx/sites-enabled/client
echo ${SWAP} > /mnt/c/Projects/nginx-bg/active
service nginx restart