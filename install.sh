#!/bin/bash

#Adding permission to the telegram-send script and copying it to the executable's folder
chmod +x telegram-send.sh

sudo cp telegram-send.sh /usr/bin/telegram-send
sudo chown root:root /usr/bin/telegram-send

mkdir -p /var/serveraccesslogging
sudo cp .env /var/serveraccesslogging/.env.local
sudo cp message.txt /var/serveraccesslogging/message.txt

#Copying the notify script into the profile.d folder to make it execute on login
sudo cp access-notify.sh /etc/profile.d/access-notify.sh

echo "Completed! Now the file .env is in this folder: /var/serveraccesslogging/.env, and you can customize the message in the same folder but in the file message.txt"

