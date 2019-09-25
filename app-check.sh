#!/bin/bash
CONTAINER=mern_docker_full_stack_app
echo $CONTAINER

#RUNNING=$(sudo docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)
#RUNNING=$(sudo docker inspect -f '{{.State.Running}}' $CONTAINER 2> /dev/null)
#echo $?

#RUNNING=`sudo docker container ls --filter name=devops_pipeline_demo`
RUNNING=`docker container ls --filter name=mern_docker_full_stack_app | awk '{ print $12 }' | sed ':a;N;$!ba;s/\n//g'`
if [ "$RUNNING" != "$CONTAINER" ]; then
  echo "Container does not exist...Spinning it up."
else
  echo "Container running... Spinning it down first."
  docker rm -f $CONTAINER
fi


#if [ "$?" -eq 1 ]; then
#  echo "'$CONTAINER' does not exist."
#else
#  sudo docker rm -f $CONTAINER
#fi

# Check if docker is running
#docker_state=$(sudo docker   >/dev/null 2>&1)
#if [[ $? -ne 0 ]]; then
#    echo "Docker does not seem to be running, run it first and retry"
#    exit 1
#else
#   sudo docker rm -f $CONTAINER
#fi

# run your container
echo ""
echo "..... Deployment Phase Started :: Building Docker Container :: ......"
#	docker run -d -p 8180:8080 --name devops_pipeline_demo devops_pipeline_demo
docker run -d --name mern_docker_full_stack_app -p 5000:5000 -p 3000:3000 -v /home/patrick/Apps/MERN-AUTH-JENKS-K8S:/var/lib/jenkins/workspace/mern_docker/:ro mern_docker_full_stack_app:latest
#echo ""
#echo "..... Deployment Phase Started :: Building Docker Container :: ......"
#	docker run -d -p 8180:8080 --name devops_pipeline_demo devops_pipeline_demo
#docker run -d --name mern_docker_full_stack_app -p 5000:5000 -p 3000:3000 -v /home/patrick/Apps/MERN-AUTH-DOCKER:/var/lib/jenkins/workspace/mern_docker/:ro mern_docker_full_stack_app:latest


#-Completion
IP=`docker inspect -f "{{ .NetworkSettings.IPAddress }}" mern_docker_full_stack_app`
echo "--------------------------------------------------------"
echo "View App deployed here: http://$IP:3000"
echo "--------------------------------------------------------"

#docker_state=$(docker inspect -f '{{.State.Running}}' $CONTAINER >/dev/null 2>&1)
#if [[ $? -ne 0 ]]; then
