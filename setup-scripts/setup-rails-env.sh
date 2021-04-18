#! /bin/bash
set -e

RUBY_VERSION=${1:-2.4.1}

sudo apt-get install -y nodejs \
  nginx \
  redis-server \
  software-properties-common \
  postgresql-client \
  libpq5 \
  libpq-dev \
  libxml2-dev \
  libxslt-dev \
  libjemalloc2 \
  libjemalloc-dev


echo progress-bar >> ~/.curlrc
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --with-gems="hirb"


source ~/.rvm/scripts/rvm
rvm install $RUBY_VERSION -C --with-jemalloc
rvm --default use $RUBY_VERSION

gem install bundler
gem install rails
bundle config build.pg --with-pg-config=/usr/bin/pg_config

echo "def clear;system('clear');end" >> ~/.irbrc
echo "require 'hirb'" >> ~/.irbrc
echo "Hirb.enable" >> ~/.irbrc

# # CUSTOM INSTALL FOR POSTGRES GEM
# sudo apt-get install postgresql-client libpq5 libpq-dev 
# bundle config build.pg --with-pg-config=/usr/bin/pg_config

# # CUSTOM INSTALL FOR NOKOGIRI GEM
# sudo apt-get install libxml2-dev libxslt-dev
# gem install nokogiri -- --use-system-libraries
# bundle config build.nokogiri --use-system-libraries

# # DEPENDENCIES FOR RMAGICK
# sudo apt-get install build-essential imagemagick libmagickcore-dev libmagickwand-dev