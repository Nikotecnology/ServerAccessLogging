#!/bin/bash

#Here you can customize witch information you want to send to the user/'s
hostname="$(hostname)"
login_ip="$(echo $SSH_CONNECTION | cut -d " " -f 1)"
login_date="$(date +"%A %e %b %Y -  %d\/%m\/%y - %r")"
login_name="$(whoami)"
session_id="$(echo "$(tty | sed -e 's:/dev/::')")"

telegram-send "$(sed -e 's/${hostname}/'$hostname'/' -e 's/${login_name}/'$login_name'/' -e 's/${login_ip}/'$login_ip'/' -e 's/${login_date}/'"$login_date"'/' -e 's/${session_id}/'"$(echo $session_id | sed 's#/#\\/#g')"'/' /var/serveraccesslogging/message.txt)"

