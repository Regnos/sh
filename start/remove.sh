#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

if [ $UID -ne 0 ]; then
  echo -e "\033[41;37mStopped: root is required to run this script.  \033[0m"
  exit 1
fi

echo "Stopping application..."
/etc/init.d/shadowsocks stop

echo "Removing files..."
rm -rf /usr/local/shadowsocks
rm -rf /etc/init.d/shadowsocks
rm -rf /etc/shadowsocks.json

echo "Done."
