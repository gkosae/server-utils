#! /bin/bash
set -e

. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit -y
sudo systemctl enable --now cockpit.socket

# COCKPIT PCP
sudo apt install cockpit-pcp

# COCKPIT NAVIGATOR
sudo apt install -y gdebi
wget https://github.com/45Drives/cockpit-navigator/releases/download/v0.5.8/cockpit-navigator_0.5.8-1focal_all.deb
sudo gdebi -n cockpit-navigator_0.5.8-1focal_all.deb
sudo rm cockpit-navigator_0.5.8-1focal_all.deb

# COCKPIT DOCKER
# wget https://launchpad.net/ubuntu/+source/cockpit/215-1~ubuntu19.10.1/+build/18889196/+files/cockpit-docker_215-1~ubuntu19.10.1_all.deb
# sudo gdebi -n cockpit-docker_215-1\~ubuntu19.10.1_all.deb
# rm cockpit-docker_215-1\~ubuntu19.10.1_all.deb
