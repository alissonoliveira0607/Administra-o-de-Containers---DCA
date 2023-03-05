#!/bin/bash

machines=( "18.212.249.227" "54.224.87.154" "18.208.157.78" )
user=ubuntu
key_path="/c/Users/ALISSON OLIVEIRA/.ssh/devops-vg-aws.pem"
command=$1

for machine in "${machines[@]}"
do
    echo "$user@$machine"
    ssh -i "$key_path" "$user@$machine" "$command"
done