#!/bin/bash

SSH_PUBLIC_KEY_FILE=ansible/ssh/id_rsa.pub
SSH_PUBLIC_KEY=$(cat "$SSH_PUBLIC_KEY_FILE")

docker network create --subnet=172.18.0.0/100 Docker_net

docker run -ti --privileged -d --net Docker_net --ip 172.18.0.10 -P -e AUTHORIZED_KEYS="$SSH_PUBLIC_KEY" applications:latest

docker run -ti --privileged -d --net Docker_net --ip 172.18.0.11 -P -e AUTHORIZED_KEYS="$SSH_PUBLIC_KEY" applications:latest

cd ansible && ansible-playbook -i environment/dev/inventory.yml install-app.yml --private-key ssh/id_rsa
