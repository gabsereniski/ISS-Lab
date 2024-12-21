#!/bin/bash

docker-compose down -v
cd /home/honeypot
rm -r /home/honeypot/docker
rsync -a /mnt/sharedf/honeypot/home/honeypot/ /home/honeypot/
cd /home/honeypot/docker
docker-compose up --build -d
echo "wait..."
sleep 10s
echo "ok."
