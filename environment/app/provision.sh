#!/bin/bash

# update packages
sudo apt update 
sudo apt upgrade -y

# install python & pip
sudo apt install python -y
sudo apt install python-pip -y

###### pip install --upgrade pip ###### causes unprecedented error with pip?? 
sudo apt install python3-pip -y


# install Flask
sudo pip install Flask

# clone app repo
git clone https://github.com/workwithstef/bookstore.git

## add sed substitution to replace MSDBConnect 'host' variable as necessary

# install db connnector
# pip install mysql-connector-python
pip3 install mysql-connector
pip3 install mysql-connector-python
# 
