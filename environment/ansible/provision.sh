#!/bin/bash

#Update packages
sudo apt-get update -y

#Install Ansible
sudo apt-get install python-software-properties -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y


#Send & assign public key
ssh_pub_key = File.readlines("/home/ubuntu/access/ansible_con.pub").first.strip
echo ${ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys"

