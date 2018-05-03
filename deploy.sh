#!/usr/bin/env bash

docker rmi -f $(docker images --filter "dangling=true" -q)
