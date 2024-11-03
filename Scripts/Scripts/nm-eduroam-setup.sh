#!/usr/bin/env bash

read -p "Username: " USER
read -sp "Password: " PASSWORD
echo # newline

if [[ -z "$USER" || -z "$PASSWORD" ]]; then
    echo "Username and password cannot be empty."
    exit 1
fi

LASTCHAR="${PASSWORD: -1}"
read -p "Add eduroam connection with username '$USER' and password '***${LASTCHAR}'? (y/N) " CONFIRM

if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo "Proceeding..."
else
    echo "Cancelling..."
    exit 1
fi

if nmcli con add \
    type wifi \
    ifname wlp1s0 \
    con-name eduroam \
    ssid eduroam \
    ipv4.method auto \
    802-1x.eap peap \
    802-1x.phase2-auth mschapv2 \
    802-1x.identity "$USER" \
    802-1x.password "$PASSWORD" \
    wifi-sec.key-mgmt wpa-eap; then
    echo "Connection setup successful."
else
    echo "Connection setup failed."
    exit 1
fi