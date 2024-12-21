#!/bin/bash

docker-compose down -v
cd /home/admin
rm -r /home/admin/docker
rsync -a /mnt/sharedf/admin/home/admin/ /home/admin/
cd /home/admin/docker
docker-compose up --build -d
echo "wait..."
sleep 10s
echo "ok."
