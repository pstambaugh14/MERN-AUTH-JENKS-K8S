#!/bin/bash
#docker run -d \
#  -e REGISTRY_HTTP_ADDR=0.0.0.0:5001 \
#  -p 5001:5001 \
#  --restart=always \
#  --name registry-test \
#  registry:2


docker run -d -p 5001:5001 --restart=always --name registry \
  -v /home/patrick/Apps/MERN-AUTH-JENKS-K8S/certs:/home/patrick/Apps/MERN-AUTH-JENKS-K8S/certs \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/home/patrick/Apps/MERN-AUTH-JENKS-K8S/certs/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/home/patrick/Apps/MERN-AUTH-JENKS-K8S/certs/domain.key \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:5001 \
  registry:latest



#docker run -d -p 443:5001 --name registry \
#  -v `pwd`:/etc/docker/registry/ \
#  -v registry:/var/lib/registry \
#  -e REGISTRY_HTTP_ADDR=0.0.0.0:5001 \
#  -e REGISTRY_HTTP_HOST=https://192.168.0.158 \
#  -e REGISTRY_HTTP_TLS_LETSENCRYPT_CACHEFILE=/etc/docker/registry/letsencrypt.json \
#  -e REGISTRY_HTTP_TLS_LETSENCRYPT_EMAIL=admin@example.com \
#  -e REGISTRY_PROXY_REMOTEURL=https://192.168.0.158 \
#  registry:2


## https://docs.docker.com/registry/deploying/
#docker run -d -p 443:5001 --restart=always --name registry \
#  -v /etc/letsencrypt/live/domain.example.com:/certs \
#  -v /mnt/docker-registry:/var/lib/registry \
#  -e REGISTRY_HTTP_ADDR=0.0.0.0:5001 \
#  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
#  -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
#  -e REGISTRY_AUTH=htpasswd \
#  -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
#  -e REGISTRY_AUTH_HTPASSWD_PATH=/var/lib/registry/passfile \
#  registry:latest


#Step 1. Run the local repository on server side

#docker run -d -p 5000:5000 --restart=always --name registry registry:2

#Step 2. Try to push and pull images from server side

# docker tag alpine localhost:5000/alpine
# docker push localhost:5000/alpine

#Then you can check the local repository
#$ curl http://localhost:5000/v2/_catalog
#{"repositories":["alpine"]}
