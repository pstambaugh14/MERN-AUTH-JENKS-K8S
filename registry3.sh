#!/bin/bash
docker run -d -p 443:5000 --name registry \
  -v `pwd`:/etc/docker/registry/ \
  -v registry:/var/lib/registry \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:5000 \
  -e REGISTRY_HTTP_HOST=https://docker.example.com \
  -e REGISTRY_HTTP_TLS_LETSENCRYPT_CACHEFILE=/etc/docker/registry/letsencrypt.json \
  -e REGISTRY_HTTP_TLS_LETSENCRYPT_EMAIL=admin@example.com \
  -e REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io \
  registry:2
