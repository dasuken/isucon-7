#!/bin/bash
set -e
cd /home/isucon/isubata/webapp/go
git pull
make build
./isubata
sudo nginx -s reload
