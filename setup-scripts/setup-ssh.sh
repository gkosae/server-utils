#! /bin/bash
mkdir ~/.ssh
chmod -R 700 ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
echo '# PASTE PUBLIC KEY BELOW' > ~/.ssh/authorized_keys
vi ~/.ssh/authorized_keys