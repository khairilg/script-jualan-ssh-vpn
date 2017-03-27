#!/bin/sh
PFILE=/var/run/dropbear.pid
if [ -e "${PFILE}" ] && (ps -p $(cat ${PFILE}) > /dev/null); then
        echo "proses sedang berjalan..."
        service dropbear status
        exit
else
        echo "proses tidak berjalan, restarting..."
        service dropbear restart
        exit 0
fi
