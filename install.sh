#!/bin/bash

#Adding permission to the telegram-send script and copying it to the executable's folder
chmod +x telegram-send.sh

sudo cp telegram-send.sh /usr/bin/telegram-send
sudo chown root:root /usr/bin/telegram-send

mkdir -p /var/serveraccesslogging
if ! test -f "/var/serveraccesslogging/.env.local"; then
  sudo cp .env /var/serveraccesslogging/.env.local
fi

if ! test -f "/var/serveraccesslogging/message.txt"; then
  sudo cp message.txt /var/serveraccesslogging/message.txt
fi

#Copying notify script into the profile.d folder to make it execute on login
sudo cp access-notify.sh /etc/profile.d/access-notify.sh

echo "Completed! Now the file .env.local is in this folder: /var/serveraccesslogging/.env.local, and you can customize the message in the same folder but in the file message.txt"

