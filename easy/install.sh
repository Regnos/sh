#!/bin/bash

echo "Installing..."
wget https://raw.githubusercontent.com/Regnos/sh/master/easy/easy -O /usr/bin/dsvpn

echo "Generating key..."
mkdir -p /etc/dsvpn
dd if=/dev/urandom of=/etc/dsvpn/key count=1 bs=32

echo "Configurating service..."
wget https://raw.githubusercontent.com/Regnos/sh/master/easy/dsvpn.service -O /etc/systemd/system/dsvpn.service
systemctl enable dsvpn.service
systemctl start dsvpn.service

echo "Done. Authentication information:"
echo "Key file: /etc/dsvpn/key"
echo "Base64:   $(base64 < /etc/dsvpn/key)"
