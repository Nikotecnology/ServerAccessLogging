#!/bin/bash

# check if telegram-send script exists and if folder exists and if access-notify.sh exists
if [ ! -f /usr/bin/telegram-send ] || [ ! -d /var/serveraccesslogging ] || [ ! -f /etc/profile.d/access-notify.sh ]; then
    echo "Server Access Logging is not installed."
    exit 1
fi

rm /usr/bin/telegram-send
rm -rf /var/serveraccesslogging
rm /etc/profile.d/access-notify.sh

echo "Server Access Logging has been uninstalled."