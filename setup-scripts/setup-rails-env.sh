#! /bin/bash
sudo apt-get install nodejs nginx redis-server software-properties-common postgresql-client libpq5 libpq-dev libxml2-dev libxslt-dev
echo progress-bar >> ~/.curlrc
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --with-gems="hirb"
source ~/.rvm/scripts/rvm
rvm install 2.4.1
rvm --default use 2.4.1
gem install bundler
gem install rails
bundle config build.pg --with-pg-config=/usr/bin/pg_config
echo "def clear;system('clear');end" >> ~/.irbrc
echo "require 'hirb'" >> ~/.irbrc
echo "Hirb.enable" >> ~/.irbrc