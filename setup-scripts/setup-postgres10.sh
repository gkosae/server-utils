#! /bin/bash
set -e

wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O- | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql.list
sudo apt-get update
sudo apt-get install -y postgresql-10 postgresql-contrib
