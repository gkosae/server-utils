#! /bin/bash

set -e

sudo apt install firewalld -y
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --state