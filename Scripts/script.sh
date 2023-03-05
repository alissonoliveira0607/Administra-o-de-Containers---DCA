#!/bin/bash


FILE=$1


for i in $(cat $FILE);
    do "ssh -i ~/.ssh/devops-vg-aws.pem ubuntu@$i -c 'sudo mkdir -p /etc/docker/certs.d/registry:5000'"; done
#do echo "$i"; done