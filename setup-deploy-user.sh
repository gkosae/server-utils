#! /bin/bash
sudo adduser deploy
sudo usermod -aG sudo deploy
sudo visudo -f /etc/sudoers.d/90-cloud-init-users