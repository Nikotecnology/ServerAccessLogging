#!/bin/bash

if [ -f /var/serveraccesslogging/.env.local ]; then
  export $(echo $(cat /var/serveraccesslogging/.env.local | sed 's/#.*//g'| xargs) | envsubst)
fi

if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` \"text message\""
  exit 0
fi

if [ "$#" -ne 1 ]; then
    echo "The command requires only 1 argument"
    exit 0
fi

if [ -z "$1" ]
  then
    echo "You should add a message to the first argument"
    exit 0
fi

IFS=':' read -ra USRS <<< "$USERS"
for i in "${USRS[@]}"; do
  
  if [ "$i" != "" ];
  then
    curl -s -k "GET" --data "text=$1" --data "chat_id=$i" https://api.telegram.org/bot${BOT_TOKEN%$'\r'}/sendMessage > /dev/null
  fi
done
