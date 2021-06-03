#!/bin/bash
set -e
cd /home/isucon/isubata/webapp/go
git pull origin master
make build
./isubata
sudo nginx -s reload
