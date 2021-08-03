#!/bin/bash
if [ -z "$*" ]; then echo "Please provide version number to build";exit 1;  fi
$(aws ecr get-login --no-include-email --region us-east-1)
docker build -t infodna:$1 .
docker tag infodna:$1 740749496261.dkr.ecr.us-east-1.amazonaws.com/infodna:$1
docker push 740749496261.dkr.ecr.us-east-1.amazonaws.com/infodna:$1
