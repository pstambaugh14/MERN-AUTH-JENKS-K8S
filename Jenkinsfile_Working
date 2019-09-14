#!/usr/bin/groovy
// Declarative Pipeline
//import hudson.model.*
//import hudson.EnvVars
//import groovy.json.JsonSlurperClassic
//import groovy.json.JsonBuilder
//import groovy.json.JsonOutput
//import java.net.URL
def Input

pipeline {
//    tools {nodejs "Node.js 10.16.3"}
    agent {
        any {
            image 'node:10.16.3'
//            args '-p 5000:5555'
//            args '-p 3000:3333'

            }
          }
          environment {
            CUR_DIR_VAR = "${WORKSPACE}"
//            HOME = '/var/lib/jenkins/workspace/mern_docker'  //THIS NEEDS TO BE CONFIGURED***
//            NODE_PATH = '/home/patrick/.nvm/versions/node/v10.16.3/bin/node'
//            NVM_BIN = '/home/patrick/.nvm/versions/node/v10.16.3/bin'
//            PATH = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/var/lib/jenkins/npm/bin/'
//            WORKSPACE = '/var/lib/jenkins/workspace/mern_docker'
//          CUR_DIR_VAR = '`sh echo ${WORKSPACE}`'
          }
    stages {
      stage('Checkout') {
        steps {
        checkout scm }
}
        stage('Initialize') {
          steps {
            echo 'env.CUR_DIR_VAR is now the working directory'
            //Get Proper working Directory then create variable 'workspace' for future use for absolute paths for scripts
//            def rootDir = pwd()
//            echo '$workspace is the first - groovy'
//            echo '${workspace} is the second - groovy'
//            echo 'env.workspace is the third - groovy'
            echo 'env.WORKSPACE is the first - groovy'
            echo '"${WORKSPACE}" is the second - groovy'
            sh 'echo $WORKSPACE is the first - shell'
            sh 'echo env.WORKSPACE is the second - shell'
            sh 'echo "${WORKSPACE}" is the third - shell'
//          echo 'Workspace Directory is: ${WORKSPACE}'
//          echo 'Workspace Directory is: env.WORKSPACE'
          //Test to check bash and groovy functions for environment variables
//          sh 'echo "Current Workspace is: "$WORKSPACE""'
//          sh 'CD=`pwd` && echo "Current Directory is: $CD"'
          //Test to see how vars pass
//          sh 'echo $WORKSPACE'
//          sh 'echo "$CUR_DIR_VAR"'
//          sh 'echo Current Directory is: $CD'
//        def dockerHome = tool 'myDocker'
//        env.PATH = "${dockerHome}/bin:${env.PATH}"
//            Input = load 'input.groovy'
  }
}
                //Load Stage Works
//              stage('Load') {
//                steps {
//                  script {
//                  Input = load 'input.groovy'
//                }
//        }
//}
                //Execute_Input Stage does NOT work
//              def input = load "input.groovy"
//              input.userInput()
//            stage('Execute_Input') {
//              steps {
//                script {
//                Input.userInput()
//                Input.userInput()
//            }
//        }
//    }
        stage('Build') {
            steps {
              echo 'Building..'
//Fix Broken Packages
              sh '"$CUR_DIR_VAR"/fix.sh'
              sh '"$CUR_DIR_VAR"/client/fix.sh'
//              sh '/usr/local/lib/node_modules/npm/fix.sh'
//              sh '/home/patrick/.nvm/versions/node/v12.10.0/lib/node_modules/npm'
// Install npm
              sh 'node -v'
              sh 'npm install'
//Fix Broken Packages
              sh 'sleep 30'
              sh '"$CUR_DIR_VAR"/fix.sh'
              sh 'sleep 1'
              //sh 'sleep 5'
              sh '"$CUR_DIR_VAR"/client/fix.sh'
              sh 'sleep 10'
              sh '"$CUR_DIR_VAR"/nodemon.sh'
              sh 'sleep 1'
              //sh 'rm -f /var/lib/jenkins/workspace/mern_docker/client/package-lock.json && npm cache clean --force'
              //sh 'sleep 30'
//            sh '/usr/local/lib/node_modules/npm/fix.sh'
//            sh '/home/patrick/.nvm/versions/node/v12.10.0/lib/node_modules/npm'
//Final npm install script for local
//            sh '/home/patrick/.nvm/versions/node/v12.10.0/bin/npm run client-install'
              //sh '/var/lib/jenkins/workspace/mern_docker/fix.sh'
              sh '"$CUR_DIR_VAR"/client/fix.sh'
              sh 'sleep 5'
              sh 'rm -f "$CUR_DIR_VAR"/client/package-lock.json && npm cache clean --force'
              sh 'sleep 30'
              sh 'npm cache clean --force'
              sh 'npm run client-install'
              //sh 'npm install --prefix client'
              //Fix Broken Packages
              //sh 'sleep 30'
              //sh '/var/lib/jenkins/workspace/mern_docker/fix.sh'
              //sh '/var/lib/jenkins/workspace/mern_docker/client/fix.sh'
//             sh 'npm test'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
          //environment {
            //PATH = "$PATH:=/usr/bin" }
            steps {
                echo 'Deploying....'
                //app-check.sh checks to see if application is running and will spin up if or not running and remove old instance if running
                sh '"$CUR_DIR_VAR"/app-check.sh'
//                sh 'docker rm -f mern_docker_full_stack_app'
//                sh 'docker stop mern_docker_full_stack_app'
//                sh 'docker run -d --name mern_docker_full_stack_app -p 5000:5000 -p 3000:3000 mern_docker_full_stack_app:latest'
//                sh 'docker run -d --name mern_docker_full_stack_app -p 5000:5000 -p 3000:3000 -v /home/patrick/Apps/MERN-AUTH-DOCKER:/var/lib/jenkins/workspace/mern_docker/:ro mern_docker_full_stack_app:latest'
                //sh 'docker container run mern_docker_full_stack_app'
//                timeout(time: 3, unit: 'MINUTES') {
//                sh 'docker-compose up'
//                }
                //sh 'docker container run -d mern_docker_full_stack_app -p 5000:5555 -p 3000:3333'
                //sh 'docker-compose up -p'
                //sh 'chmod +x /var/lib/jenkins/workspace/mern_docker/docker-compose-up.sh'
                //sh '/var/lib/jenkins/workspace/mern_docker/docker-compose-up.sh'
                //sh 'npm run dev'
                //echo 'PATH should be $PATH'
                //sh 'docker-compose up --build -d'
                //echo Server runs on http://<docker-ip>:5555 and client on http://localhost:3333

            }
        }
      }
        //Clean Workspace at the end of Build
        post {
          always {
            cleanWs()
    }
  }
}
