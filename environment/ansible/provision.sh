#!/bin/bash

#Update packages
sudo apt-get update -y

#Install Ansible
sudo apt-get install python-software-properties -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y


#Send & assign access keys
cat /home/ubuntu/access/ansible_con.pub | head -1 | xargs echo >> /home/vagrant/.ssh/authorized_keys 
cp /home/ubuntu/access/ansible_con /home/vagrant/.ssh/
#cp /home/ubuntu/access/ansible_con.pub /home/vagrant/.ssh/ 

#Update inventory
sudo rm /etc/ansible/hosts
sudo cp /home/ubuntu/files/hosts /etc/ansible/

#Send public key to remote nodes
ssh-copy-id -i /home/ubuntu/access/ansible_con.pub vagrant@192.168.10.100
ssh-copy-id -i /home/ubuntu/access/ansible_con.pub vagrant@192.168.10.200  
