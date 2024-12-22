#!/bin/bash

docker-compose down -v
rsync -a /mnt/sharedf/admin/home/admin/ /home/admin/
cd /home/admin/docker
docker-compose up --build -d
echo "wait..."
sleep 10s
echo "ok."
