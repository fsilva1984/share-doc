#!/bin/bash

wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null;

echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-3_1-debian-bookworm-amd64 bookworm main" | \
sudo tee /etc/apt/sources.list.d/regolith.list;

sudo apt update;
sudo apt install -y regolith-desktop regolith-session-flashback regolith-look-lascaille

sleep 10
systemctl reboot