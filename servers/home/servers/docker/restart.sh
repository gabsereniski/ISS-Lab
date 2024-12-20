#!/bin/bash

docker-compose down -v
cd /home/servers
rm -r /home/servers/docker
rsync -a /mnt/sharedf/servers/home/servers/ /home/servers/
cd /home/servers/docker
docker-compose up --build -d
echo "wait..."
sleep 10s
echo "ok."
