#! /bin/bash

set -e

sudo rm -r /root/cron || true
sudo cp -r ./data/cron /root/
sudo mkdir -p /root/cron/logs

echo "################# START ######################"
echo "* * * * *  /usr/bin/env > /root/cron/env"
echo "0 0 * * * /root/cron/tasks/renew-certs"
echo "0 0 * * * /root/cron/tasks/update-youtube-dl"
echo "0 0 * * * /root/cron/tasks/update-yt-dlp"
echo "0 0 * * 0 /root/cron/tasks/update-docker-apps"
echo "0 0 * * * /root/cron/tasks/sync-audio-files"
echo "################# END ######################"

echo "Copy and paste this text above in the file about to be opened"
read -n 1 -s -r -p "Press any key to open the file"
sudo crontab -e