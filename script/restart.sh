#!/bin/bash
set -e
cd /home/isucon/isubata/webapp/go
git pull origin master
make build
systemctl restart isubata.golang
systemctl restart nginx
