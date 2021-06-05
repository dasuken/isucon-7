#!/bin/bash
set -e
cd /home/isucon/isubata/webapp/go
git pull origin master
make build
ISUBATA_DB_HOST=35.221.100.66 ISUBATA_DB_PASSWORD=isucon ISUBATA_DB_USER=isucon ./isubata
sudo nginx -s reload
cp ./restart.sh /home/isucon/restart.sh