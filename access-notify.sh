#!/bin/bash

#Here you can customize witch information you want to send to the user/'s
hostname="$(hostname)"
login_ip="$(echo $SSH_CONNECTION | cut -d " " -f 1)"
login_date="$(date +"%A %e %b %Y -  %d\/%m\/%y - %r")"
login_name="$(whoami)"
session_id="$(echo "$(tty | sed -e 's:/dev/::')")"

if [[ $(cat /var/log/auth.log | egrep '^.*?\bpublickey\b.*?\b'"$login_ip"'\b.*?$') ]]; then
  method="Public Key Authentication"
else
  method="Password(or generic) Authentication"
fi

telegram-send "$(sed -e 's/${hostname}/'$hostname'/' -e 's/${login_name}/'$login_name'/' -e 's/${login_ip}/'$login_ip'/' -e 's/${login_date}/'"$login_date"'/' -e 's/${session_id}/'"$(echo $session_id | sed 's#/#\\/#g')"'/' -e 's/${method}/'"$method"'/' /var/serveraccesslogging/message.txt)"

