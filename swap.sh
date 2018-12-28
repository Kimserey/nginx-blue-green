#!/usr/bin/env bash

set -ue

CURRENT_ACTIVE=$(cat /mnt/c/Projects/nginx-bg/active) 

if [ ${CURRENT_ACTIVE} = "blue" ]; then
  LIVE=green
  STAGE=blue
elif [ ${CURRENT_ACTIVE} = "green" ]; then
  LIVE=blue
  STAGE=green
else
  echo ERROR: Failed to recognize ACTIVE instance.
  echo Verify that \"active\" configuration exists and that the configuration is either \"blue\"" or \"green\"".
  exit 1
fi

ln -sf /etc/nginx/sites-available/${LIVE}-live /etc/nginx/sites-enabled/client-live
ln -sf /etc/nginx/sites-available/${STAGE}-stage /etc/nginx/sites-enabled/client-stage
echo ${LIVE} > /mnt/c/Projects/nginx-bg/active
service nginx restart