#!/bin/bash
#Script untuk menjalankan autokill cron by Khairil Gunawan

mkdir -p "$HOME/tmp"
PIDFILE="$HOME/tmp/autokill.pid"

if [ -e "${PIDFILE}" ] && (ps -u $(whoami) -opid= |
                           grep -P "^\s*$(cat ${PIDFILE})$" &> /dev/null); then
  echo "Already running."
  exit 99
fi

/usr/bin/autokill > $HOME/tmp/autokill.log &

echo $! > "${PIDFILE}"
chmod 644 "${PIDFILE}"
