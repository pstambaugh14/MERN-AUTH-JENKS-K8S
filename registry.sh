#!/bin/bash
docker run -d \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:5001 \
  -p 5001:5001 \
  --restart=always \
  --name registry-test \
  registry:2

#Step 1. Run the local repository on server side

#docker run -d -p 5000:5000 --restart=always --name registry registry:2

#Step 2. Try to push and pull images from server side

# docker tag alpine localhost:5000/alpine
# docker push localhost:5000/alpine

#Then you can check the local repository
#$ curl http://localhost:5000/v2/_catalog
#{"repositories":["alpine"]}
