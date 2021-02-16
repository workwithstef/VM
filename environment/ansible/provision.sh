#!/bin/bash

#Update packages
sudo apt-get update -y

#Install Ansible
sudo apt-get install python-software-properties -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y


#Send & assign public key
cat /home/ubuntu/access/ansible_con.pub | head -1 | xargs echo >> /home/vagrant/.ssh/authorized_keys 

#Update inventory
sudo rm /etc/ansible/hosts
sudo cp /home/ubuntu/files/hosts /etc/ansible/
