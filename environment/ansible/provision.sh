#!/bin/bash

#Update packages
sudo apt-get update -y

#Install Ansible
sudo apt-get install python-software-properties -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y


