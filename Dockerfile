//FROM node:10.16.3
//RUN mkdir -p /var/lib/jenkins/workspace/mern_docker/
FROM ubuntu:18.04
RUN apt update \
 && apt install -y \
    curl \
    gnupg \
    gcc \
    g++ \
    make \
 && curl -sL https://deb.nodesource.com/setup_10.16.3 | bash - \
 && apt install -y nodejs \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /var/lib/jenkins/workspace/mern_docker/
ENV PROJECT_HOME /var/lib/jenkins/workspace/mern_docker/
WORKDIR /var/lib/jenkins/workspace/mern_docker/
COPY package.json .
RUN npm install && npm run client-install
COPY . ./
CMD [ "npm", "run", "dev" ]
