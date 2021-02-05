#!/bin/bash

sudo mysqldump -u root -p$MY_SQL books > /home/vagrant/db/book_db_backup.sql
