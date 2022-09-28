#!/bin/bash

cd /home/ubuntu/docker_apps
echo "---Deploying Containers---"

cd bazarr && docker compose up -d --force-recreate
cd .. && cd file_browser && docker compose up -d --force-recreate
cd .. && cd heimdall && docker compose up -d --force-recreate
cd .. && cd jellyfin && docker compose up -d --force-recreate
cd .. && cd monitoring && docker compose up -d --force-recreate
cd .. && cd qbittorrent && docker compose up -d --force-recreate
cd .. && cd radarr && docker compose up -d --force-recreate
cd .. && cd sonarr && docker compose up -d --force-recreate
cd .. && cd unmanic && docker compose up -d --force-recreate
cd .. && cd uptime_kuma && docker compose up -d --force-recreate
cd .. && cd wireguard && docker compose up -d --force-recreate
cd .. && cd prowlarr && docker compose up -d --force-recreate
cd .. && cd guacamole && docker compose up -d --force-recreate
cd .. && cd nginx && docker compose up -d --force-recreate
cd .. && cd portainer && docker compose up -d --force-recreate