#!/bin/sh

set -e

if [ ! -d aws-serverless-java-container ]; then
 git clone https://github.com/awslabs/aws-serverless-java-container
fi
cd aws-serverless-java-container/samples/jersey/pet-store
mvn package
echo " open http://localhost:3000/pets "
sam local start-api -t sam.yaml
 
