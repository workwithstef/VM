#!/bin/bash

# replace sshd_config PassAuth
sudo sed -i "s/\(PasswordAuthentication*[[*blank*]]\)/ .*\1 yes/ /etc/ssh/sshd_config

sudo systemctl restart sshd
