#!/bin/bash

## update all containers quietly 
docker-compose pull >/dev/null

## Run container to show repos
docker-compose up

## clean up, silently
docker-compose rm -f &> /dev/null

