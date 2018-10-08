#!/bin/bash

docker -v > /tmp/checkdocker.txt

if [ ! -s /tmp/checkapp.txt ]; then

	sudo apt-get install \
		apt-transport-https \
		acl \
		ca-certificates \
		curl \
		software-properties-common

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

	sudo add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) \
		stable"

	sudo apt-get update

	sudo apt-get install -y docker-ce

	sudo usermod -a -G docker $USER
	sudo gpasswd -a $USER docker
	sudo setfacl -m user:$USER:rw /var/run/docker.sock

fi

rm /tmp/checkdocker.txt
