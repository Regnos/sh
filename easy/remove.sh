#!/bin/bash

echo "Stopping service..."
systemctl stop dsvpn.service

echo "Removing service..."
systemctl disable dsvpn.service
rm -f /etc/systemd/system/dsvpn.service

echo "Uninstalling..."
rm -f /usr/bin/dsvpn

echo "Removing key..."
rm -rf /etc/dsvpn/

echo "Done."
