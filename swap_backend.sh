#!/usr/bin/env bash

set -ue

CURRENT_ACTIVE=$(cat /mnt/c/Projects/nginx-bg/active_backend) 

if [ ${CURRENT_ACTIVE} = "blue" ]; then
  LIVE=green
  STAGE=blue
elif [ ${CURRENT_ACTIVE} = "green" ]; then
  LIVE=blue
  STAGE=green
else
  echo ERROR: Failed to recognize ACTIVE instance.
  echo Verify that \"active_backend\" configuration exists and that the configuration is either \"blue\"" or \"green\"".
  exit 1
fi

ln -sf /etc/nginx/sites-available/upstream-backend-${LIVE} /etc/nginx/sites-enabled/upstream-backend
echo ${LIVE} > /mnt/c/Projects/nginx-bg/active_backend

service nginx restart