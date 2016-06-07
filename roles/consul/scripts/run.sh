#!/usr/env/bin bash

if ! docker inspect consul > /dev/null 2>&1; then
    docker run \
        -d \
        --name=consul \
        --net=host \
        --restart=always \
        -v /consul/consul.json:/consul/config/consul.json
        -p 53:8600/tcp \
        -p 53:8600/udp \
        consul agent -config=/consul/config/consul.json
else
    docker kill -s HUP consul
fi