#! /bin/bash
set -e

echo "========================================================="
echo "                       IMPORTANT"
echo "========================================================="
echo "Ensure udp ports 500 and 4500 are open in your firewall"
echo "Ensure these are set in /etc/sysctl.conf and reload sysctl with `sudo sysctl -p`"
echo "net.ipv4.ip_forward=1"
echo "net.ipv4.conf.default.accept_redirects=0"
echo "net.ipv4.conf.all.accept_redirects = 0"
echo "net.ipv4.conf.default.send_redirects=0"
echo "net.ipv4.conf.all.send_redirects = 0"

sudo apt-get install -y git
pushd ~
git clone https://github.com/libreswan/libreswan.git
sudo apt-get install -y libnss3-dev libnspr4-dev pkg-config libpam-dev \
                libcap-ng-dev libcap-ng-utils libselinux-dev \
                libcurl3-nss-dev flex bison gcc make \
                libunbound-dev libnss3-tools libevent-dev xmlto \
                libsystemd-dev

cd libreswan
git checkout v3.21
git checkout -b v3.21
make programs || echo ""
sudo make install
sudo systemctl enable ipsec.service
sudo systemctl start ipsec.service
popd