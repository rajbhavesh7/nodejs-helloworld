#!/usr/bin/env bash

# Clone repository
echo "Cloning repository.."
git https://github.com/rajbhavesh7/nodejs-helloworld.git
cd nodejs-helloworld

# Build Jenkins Docker image
echo "Building docker image for Jenkins.."
docker build -t jenkins_nodejs jenkins/

# Start Jenkins server
echo "Starting Jenkins server.."
kubectl apply -f kubernetes/jenkins.yaml

# Access Jenkins
echo "Jenkins is accessible at: http://localhost/jenkins"
echo "-"
echo "Download Jenkins Agent jar file from: http://localhost/jenkins/jnlpJars/agent.jar"
echo "-"
echo "Get the Agent startup command from this URL: http://localhost/jenkins/computer/parent/"
echo "-"
echo "Jenkins Credentials:"
echo "Username: admin"
echo "Password: admin"
echo "-"
echo "After logging in as admin, execute:"
echo "* Build job to build NodeJS docker image."
echo "* Deploy job to deploy NodeJS helm chart to your kubernetes cluster."
echo "Application will be accessible at URL: http://localhost"