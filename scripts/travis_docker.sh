#!/bin/bash
echo $TRAVIS_TAG;
echo $TRAVIS_BRANCH;

if [ "$TRAVIS_BRANCH" == "master" ]
then
    docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD" $DOCKER_REGISTRY;
    docker tag home $DOCKER_REPO/home:latest;
    docker push $DOCKER_REPO/home:latest;
elif [ "$TRAVIS_TAG" == "$TRAVIS_BRANCH" ]
then 
    docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD" $DOCKER_REGISTRY;
    docker tag home $DOCKER_REPO/home:${TRAVIS_TAG};
    docker push $DOCKER_REPO/home:${TRAVIS_TAG};
fi