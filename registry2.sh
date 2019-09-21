#!/bin/bash
docker run -d -p 5001:5001 --restart=always --name registry -v /home/patrick/Apps/MERN-AUTH-JENKS-K8S/registry -e REGISTRY_HTTP_ADDR=0.0.0.0:5001 -e REGISTRY_HTTP_HOST=192.168.0.158 -e REGISTRY_HTTP_TLS_CERTIFICATE=/home/patrick/Apps/MERN-AUTH-JENKS-K8S/registry/cert.crt -e REGISTRY_HTTP_TLS_KEY=/home/patrick/Apps/MERN-AUTH-JENKS-K8S/registry/key.key registry:latest
