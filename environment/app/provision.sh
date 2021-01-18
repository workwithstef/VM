#!/bin/bash

# update packages
sudo apt update 
sudo apt upgrade -y

# install python & pip
sudo apt install python -y
sudo apt install python3-pip -y



# install Flask
sudo pip3 install Flask

# clone app repo
git clone https://github.com/workwithstef/bookstore.git
