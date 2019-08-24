#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

if [ $UID -ne 0 ]; then
  echo -e "\033[41;37mStopped: root is required to run this script.  \033[0m"
  exit 1
fi

echo "Updating APT source..."
apt update

echo "Installing dependencies..."
apt install python python-m2crypto curl wget unzip libsodium* -y

echo "Installing application..."
wget https://raw.githubusercontent.com/Regnos/sh/master/start/main.zip -O /usr/local/main.zip
unzip /usr/local/main.zip -d /usr/local
rm -f /usr/local/main.zip

echo "Configurating service..."
wget https://raw.githubusercontent.com/Regnos/sh/master/start/service -O /etc/init.d/shadowsocks
chmod +x /etc/init.d/shadowsocks
update-rc.d -f shadowsocks defaults

echo "Configurating application..."
wget https://raw.githubusercontent.com/Regnos/sh/master/start/config.json -O /etc/shadowsocks.json

echo "Starting..."
/etc/init.d/shadowsocks start

echo "Done."
