#! /bin/bash
set -e

USER=${1:-deploy}

sudo adduser $USER
sudo usermod -aG sudo $USER
echo "Copy and paste this snippet '$USER ALL=(ALL) NOPASSWD:ALL' in the file about to be opened"
read -n 1 -s -r -p "Press any key to open the file"
sudo visudo -f /etc/sudoers.d/90-cloud-init-users
echo "Deploy user setup successfully"