#!/usr/bin/groovy
// Declarative Pipeline
def project = 'MERN-AUTH-JENKS-K8S'
def appName = 'MERN-AUTH-JENKS-K8S'
def serviceName = "${appName}-service"
def imageVersion = 'latest'
def namespace = 'development'
//def imageTag = "gcr.io/${project}/${appName}:${imageVersion}.${env.BUILD_NUMBER}"
def imageTag = "${project}/${appName}:${imageVersion}.${env.BUILD_NUMBER}"
pipeline {
    agent {
        any {
            image 'node:10.16.3'
            }
          }
          environment {
            CUR_DIR_VAR = "${WORKSPACE}"
          }
    stages {
      stage('Checkout') {
        steps {
        checkout scm }
}
        stage('Initialize') {
          steps {
            echo 'env.CUR_DIR_VAR is now the working directory'
            echo 'env.WORKSPACE is the first - groovy'
            echo '"${WORKSPACE}" is the second - groovy'
            sh 'echo $WORKSPACE is the first - shell'
            sh 'echo env.WORKSPACE is the second - shell'
            sh 'echo "${WORKSPACE}" is the third - shell'
  }
}
        stage('Build') {
            steps {
              echo 'Building..'
//Fix Broken Packages
              sh '"$CUR_DIR_VAR"/fix.sh'
              sh '"$CUR_DIR_VAR"/client/fix.sh'
// Install npm
              sh 'node -v'
              sh 'npm install'
//Fix Broken Packages
              sh 'sleep 30'
              sh '"$CUR_DIR_VAR"/fix.sh'
              sh 'sleep 1'
              sh '"$CUR_DIR_VAR"/client/fix.sh'
              sh 'sleep 10'
              sh '"$CUR_DIR_VAR"/nodemon.sh'
              sh 'sleep 1'
              sh '"$CUR_DIR_VAR"/client/fix.sh'
              sh 'sleep 5'
              sh 'rm -f "$CUR_DIR_VAR"/client/package-lock.json && npm cache clean --force'
              sh 'sleep 30'
              sh 'npm cache clean --force'
              sh 'npm run client-install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
//        stage('Deploy') {
//            steps {
//                echo 'Deploying....'
                //app-check.sh checks to see if application is running and will spin up if or not running and remove old instance if running
//                sh '"$CUR_DIR_VAR"/app-check.sh'
//            }
//        }
//      }
//Stage 3 : Deploy Application
 stage('Deploy Application') {
      steps {
//      withKubeConfig([
//                    credentialsId: 'jenkins'
//                    caCertificate: '/home/patrick/.minikube/ca.crt'
//                    serverUrl: '192.168.99.100:8443',
//                    contextName: '<context-name>',
//                    clusterName: '<cluster-name>',
//                    namespace: 'development'
//                    ])
//      steps {
//        switch (namespace) {
             //Roll out to Dev Environment
//             case "development":
                  // Create namespace if it doesn't exist
                  sh("kubectl get ns ${namespace} || kubectl create ns ${namespace}")
          //Update the imagetag to the latest version
//                  sh("sed -i.bak 's#${project}/${appName}:${imageVersion}#${imageTag}#' ./*.yaml")
                  sh("sed -i.bak 's#${WORKSPACE}/mern_docker_full_stack_app:${imageVersion}#${imageTag}#' ./*.yaml") //or mern_docker_full_stack_app
                  //Create or update resources
                  sh("kubectl --namespace=${namespace} apply -f ./deployment.yaml")
                  sh("kubectl --namespace=${namespace} apply -f ./service.yaml")
          //Grab the external Ip address of the service
                  sh("echo http://`kubectl --namespace=${namespace} get service/${feSvcName} --output=json | jq -r '.status.loadBalancer.ingress[0].ip'` > ${feSvcName}")
//                  break

       //Roll out to Prod Environment
//             case "production":
                  // Create namespace if it doesn't exist
//                  sh("kubectl get ns ${namespace} || kubectl create ns ${namespace}")
          //Update the imagetag to the latest version
//                  sh("sed -i.bak 's#gcr.io/${project}/${appName}:${imageVersion}#${imageTag}#' ./k8s/production/*.yaml")
//          //Create or update resources
//                  sh("kubectl --namespace=${namespace} apply -f k8s/production/deployment.yaml")
//                  sh("kubectl --namespace=${namespace} apply -f k8s/production/service.yaml")
          //Grab the external Ip address of the service
//                  sh("echo http://`kubectl --namespace=${namespace} get service/${feSvcName} --output=json | jq -r '.status.loadBalancer.ingress[0].ip'` > ${feSvcName}")
//                  break

//             default:
//                  sh("kubectl get ns ${namespace} || kubectl create ns ${namespace}")
//                  //sh("sed -i.bak 's#gcr.io/${project}/${appName}:${imageVersion}#${imageTag}#' ./k8s/development/*.yaml")
//                  sh("sed -i.bak 's#gcr.io/${project}/${appName}:${imageVersion}#${imageTag}#' ./*.yaml")
//                  //sh("kubectl --namespace=${namespace} apply -f k8s/development/deployment.yaml")
//                  sh("kubectl --namespace=${namespace} apply -f ./deployment.yaml")
//                  //sh("kubectl --namespace=${namespace} apply -f k8s/development/service.yaml")
//                  sh("kubectl --namespace=${namespace} apply -f ./service.yaml")
//                  sh("echo http://`kubectl --namespace=${namespace} get service/${feSvcName} --output=json | jq -r '.status.loadBalancer.ingress[0].ip'` > ${feSvcName}")
//                  break
//        }
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
