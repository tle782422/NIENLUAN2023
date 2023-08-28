#!/bin/bash

DOCKER_REPO_URI=724605254105.dkr.ecr.us-east-1.amazonaws.com


function build() {
    echo "Building service"
    docker-compose build .
}

function push() {
    #DOWNLOAD AWS CLI VA TAO IAM (ROLE=AWSEC2CONTAINERFULLACCESS).
    echo "Push images"
    $(aws ecr get-login --no-include-email --region us-east-1)

    docker tag auth-jwt-service:latest 724605254105.dkr.ecr.us-east-1.amazonaws.com/auth-jwt-service:latest
    docker tag customer-service:latest 724605254105.dkr.ecr.us-east-1.amazonaws.com/customer-service:latest
    docker tag gateway:latest 724605254105.dkr.ecr.us-east-1.amazonaws.com/gateway:latest
    docker tag redis:latest 724605254105.dkr.ecr.us-east-1.amazonaws.com/redis:latest
    docker tag sec-service:latest 724605254105.dkr.ecr.us-east-1.amazonaws.com/sec-service:latest
    docker tag web-angular:latest 724605254105.dkr.ecr.us-east-1.amazonaws.com/web-angular:latest

    docker push $DOCKER_REPO_URI/auth-jwt-service:latest
    docker push $DOCKER_REPO_URI/customer-service:latest
    docker push $DOCKER_REPO_URI/gateway:latest
    docker push $DOCKER_REPO_URI/redis:latest
    docker push $DOCKER_REPO_URI/sec-service:latest
    docker push $DOCKER_REPO_URI/web-angular:latest
}

function options() {
      echo "./start build -> Build docker images"
      echo "./start push -> Push images to docker registry. Plz configure repo  before push."
}



for var in "$@"
do
  case "$var" in
    build)
      build
      ;;
    push)
      push
      ;;
    *)
      options
      ;;
  esac
done

