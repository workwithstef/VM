#!/bin/bash

# update packages
sudo apt-get update 
sudo apt-get upgrade -y

# install python & pip
sudo apt-get install python -y

###### pip install --upgrade pip ###### causes unprecedented error with pip?? 
sudo apt-get install python3-pip -y

# install Flask
sudo pip3 install Flask

# clone app repo
git clone https://github.com/workwithstef/bookstore.git

# add sed substitution to replace MSDBConnect 'host' variable as necessary
sed -i "s/localhost/192.168.10.200/" /home/vagrant/bookstore/py_db.py

# edit app.run(...) to include host="192.168.10.100"
sed -i "s/localhost/192.168.10.100/" /home/vagrant/bookstore/flask_run.py

# copy pass to relevant directory tree
sudo cp /home/vagrant/app/shhh.py /home/vagrant/bookstore

# install db connnector
pip3 install mysql-connector
pip3 install mysql-connector-python
 
#start flask app
# python3 /home/vagrant/bookstore/flask_run.py &
