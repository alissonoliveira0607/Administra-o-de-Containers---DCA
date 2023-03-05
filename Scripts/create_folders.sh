#!/bin/bash

# # Lista de hosts
# FILE=$1

# # Nome do diretório a ser criado
# dir_name="/etc/docker/certs.d/registry:5000"
# user="ubuntu"

# # Loop através da lista de hosts
# for i in "$(cat $FILE)"
# do
#   # Conecte-se ao host usando o SSH e crie o diretório
#   ssh -i '/c/Users/ALISSON OLIVEIRA/.ssh/devops-vg-aws.pem' $user@$i "mkdir $dir_name"

#   # Verifique se o diretório foi criado com sucesso
#   result=$(ssh -i '/c/Users/ALISSON OLIVEIRA/.ssh/devops-vg-aws.pem' $user@$i "if [ -d $dir_name ]; then echo 'Directory created'; else echo 'Directory not created'; fi")

#   # Exiba o resultado
#   echo "$i: $result"
# done



# Lista de máquinas remotas
machines=( "3.94.116.41" "54.198.63.155" "52.54.182.134" )
user=ubuntu
# Caminho para o par de chaves SSH
key_path="/c/Users/ALISSON OLIVEIRA/.ssh/devops-vg-aws.pem"

# Loop através da lista de máquinas
for machine in "${machines[@]}"
do
   # Conecte-se à máquina remota via SSH
   echo "$user@$machine"
   ssh -i "$key_path" "$user@$machine" "if [ ! -d "/etc/docker/certs.d/registry:5000" ]; then mkdir -p /etc/docker/certs.d/registry:5000; fi"
done
