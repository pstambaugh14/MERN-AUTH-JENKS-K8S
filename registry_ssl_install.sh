#!/usr/bin/env bash

# install docker
# https://docs.docker.com/engine/installation/linux/ubuntulinux/

# install docker-compose
# https://docs.docker.com/compose/install/

# install letsencrypt
# https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04

# Generate SSL certificate for domain
/opt/letsencrypt/letsencrypt-auto certonly --keep-until-expiring --standalone -d 192.168.0.158 --email info@example.com

# Setup letsencrypt certificates renewing
line="30 2 * * 1 /opt/letsencrypt/letsencrypt-auto renew >> /var/log/letsencrypt-renew.log"
(crontab -u root -l; echo "$line" ) | crontab -u root -

# Rename SSL certificates
# https://community.letsencrypt.org/t/how-to-get-crt-and-key-files-from-i-just-have-pem-files/7348
cd /etc/letsencrypt/live/domain.example.com/
cp privkey.pem domain.key
cat cert.pem chain.pem > domain.crt
chmod 777 domain.crt
chmod 777 domain.key

# https://docs.docker.com/registry/deploying/
docker run -d -p 5001:5001 --restart=always --name registry \
  -v /etc/letsencrypt/live/domain.example.com:/certs \
  -v /opt/docker-registry:/var/lib/registry \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
  registry:2
  
# List images
# https://domain.example.com/v2/_catalog
