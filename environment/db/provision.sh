#!/bin/bash

# update packages
sudo apt-get update

# set password as env variable
. /home/vagrant/db/shhh.sh
tail -1 /home/vagrant/db/shhh.sh | xargs echo >> /home/vagrant/.bashrc


# PRESET prompted password selections 
echo "mysql-server mysql-server/root_password password $MY_SQL" | sudo debconf-set-selections 
echo "mysql-server mysql-server/root_password_again password $MY_SQL" | sudo debconf-set-selections

# install mysql server
sudo apt-get install mysql-server -y

# start mysql
#sudo systemctl start mysql
# set password
# sudo mysql -u root -e "SET PASSWORD FOR root@'localhost' = PASSWORD('$MY_SQL');"

# go into /etc/mysql/mysql.conf.d , edit 'mysqld.cnf' file so that 'bind-address' = 0.0.0.0
# this will allow access from remote servers
# use sed for this substitution
sed -i "s/\(^[[:blank:]]*bind-address*[[:blank:]]*=\) .*/\1 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf 

### PYTHON-SQL CONNECTION SET UP QUERIES
# allow access from app hostname
sudo mysql -u root -p$MY_SQL -e "GRANT ALL ON books.* TO root@192.168.10.100 IDENTIFIED BY '${MY_SQL}';"

#set up sql database
sudo mysql -u root -p$MY_SQL -e "create database books;"

# restart mysql
sudo systemctl restart mysql
sudo systemctl status mysql

# import sql database .sql file
mysql -u root -p$MY_SQL books < /home/vagrant/db/book_db_backup.sql


# script to export latest .sql file whenever machine spun up
tail -1 /home/vagrant/db/backup.sh | xargs echo >> /home/vagrant/.bashrc
