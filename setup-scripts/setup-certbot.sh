#! /bin/bash
set -e

sudo apt install certbot python3-certbot-nginx -y
sudo openssl dhparam -out /etc/letsencrypt/ssl-dhparams.pem 2048
sudo cp /usr/lib/python3/dist-packages/certbot_nginx/tls_configs/options-ssl-nginx.conf /etc/letsencrypt/