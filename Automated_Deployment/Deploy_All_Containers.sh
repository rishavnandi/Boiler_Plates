#!/bin/bash

echo "------------------------Enter Username------------------------"
read name
cd /home/$name && cd docker_apps
echo "------------------------Deploying Containers------------------------"

docker_apps=(
    "file_browser" 
    "heimdall" 
    "jellyfin"
    "monitoring" 
    "qbittorrent" 
    "radarr" 
    "sonarr" 
    "unmanic" 
    "uptime_kuma" 
    "wireguard" 
    "prowlarr" 
    "guacamole" 
    "nginx" 
    "portainer" 
    "vaultwarden"
    "code_server"
    "duplicati"
    "jellyseerr"
    "watchtower"
)

for app in ${docker_apps}[@]; do
    cd $app
    docker compose up -d --force-recreate
    cd ..
done
