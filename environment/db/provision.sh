#!/bin/bash

# update packages
sudo apt update

# install mysql server

sudo apt install mysql-server -y

# set password
# mysql.server start // systemctl start mysql
# sudo mysql -u root -e "SET PASSWORD FOR root@'localhost' = PASSWORD('password');"


# go into /etc/mysql/mysql.conf.d , edit 'mysqld.cnf' file so that 'bind-address' = 0.0.0.0
# this will allow access from remote servers
# use sed for this substitution



# restart mysql
# sudo systemctl restart mysql

