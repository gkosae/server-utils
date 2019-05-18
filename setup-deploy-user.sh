#! /bin/bash
sudo adduser deploy
sudo usermod -aG sudo deploy
echo "Copy and paste this snippet 'deploy ALL=(ALL) NOPASSWD:ALL' in the file about to be opend"
read -n 1 -s -r -p "Press any key to open the file"
sudo visudo -f /etc/sudoers.d/90-cloud-init-users
echo "Deploy user setup successfully"