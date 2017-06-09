#!/bin/bash

docker build -t jenkins-data -f ./data-volume/Dockerfile .
docker build -t jenkins-master -f ./master/Dockerfile .
