#!/bin/bash

# update packages
sudo apt update

. ~/db/shhh.sh

# install mysql server // PRESET prompted selections

echo "mysql-server mysql-server/root_password password {$MY_SQL}" | sudo debconf-set-selections 
echo "mysql-server mysql-server/root_password_again password {$MY_SQL}" | sudo debconf-set-selections

sudo apt install mysql-server -y

# start mysql
sudo systemctl start mysql

# set password
# sudo mysql -u root -e "SET PASSWORD FOR root@'localhost' = PASSWORD('$MY_SQL');"

# go into /etc/mysql/mysql.conf.d , edit 'mysqld.cnf' file so that 'bind-address' = 0.0.0.0
# this will allow access from remote servers
# use sed for this substitution

sed -i "s/\(^[[:blank:]]*bind-address*[[:blank:]]*=\) .*/\1 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf 


# restart mysql
sudo systemctl restart mysql
sudo systemctl status mysql

# import sql database .sql file
# echo "$MYSQL_PASS" | mysql -u root -p {database} < {.sql file}



