#!/usr/bin/groovy
//import hudson.security.*
//import hudson.security.csrf.*
import jenkins.model.*
//import jenkins.security.s2m.AdminWhitelistRule
import org.jenkinsci.plugins.*
//import org.jenkinsci.plugins.saml.*
// Declarative Pipeline
//import hudson.model.*
//import hudson.EnvVars
//import groovy.json.JsonSlurperClassic
//import groovy.json.JsonBuilder
//import groovy.json.JsonOutput
//import java.net.URL
def userInput
try {
    userInput = input(
        id: 'Proceed1', message: 'Was this successful?', parameters: [
        [$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Please confirm you agree with this']
        ])
} catch(err) { // input false
    def user = err.getCauses()[0].getUser()
    userInput = false
    echo "Aborted by: [${user}]"
}

node {
    if (userInput == true) {

//      if (userInput == true) {
        // do something
        echo "this was successful"
//        currentBuild.result = 'SUCCESS'
    } else {
        // do something else
        echo "this was not successful"
        currentBuild.result = 'FAILURE'
    }
}
