# Migrating App/DB onto VM

*(@workwithstef IF YOU'VE COME TO REVISE CHECK PROVISION FILES ;)... EVEN BETTER COMMAND-SPECIFIC DOCUMENTATION!)*

- When running flask remember to specify host ip as the remote server ip. 
By defualt, Flask hosts web app on localhost.

E.g:

`app.run(debug=True, host='<remote_server_ip>')`


- `mysql -p` prompts for mysql server password; then enters mysql cli

`-u <user>` - login to specific user

- `mysql -u root -p` login to root user with password

In SQL:

- `GRANT ALL ON <database>.* TO <user>@<server_ip> IDENTIFIED BY "<password>";`
This query allows inbound access from specified user/server to all <database>
tables, ALL queries can be applied.

- `GRANT SELECT, UPDATE ON games.action TO stefan@192.168.43.77 IDENTIFIED BY "<password>";`
Allows SELECT & CREATE queries to be applied to the 'action' table in 'games' database, by stefan@192.168.43.77.
Password restricted access.

Export/Import MySQL database:

- exporting: `mysqldump -u root -p {database} > {filename.sql}`
- importing: `mysql -u root -p {database} < {.sql file}`

Executing MySQL queries via bash:

`mysql -u USER -pPASSWORD -e "SQL_QUERY"`
*"-p{PASSWORD}" enters password via command so useful in bash scripts; although not the most secure*


### HOW TO AUTOMATE EXPORT OF DB ???

TO-DO:
-  EXPORT MYSQL FILE WITHIN DB VM |&| SEND TO HOST MACHINE



########### BLOCKERS

- Unexpected 'SyntaxError' when attempting to run flask app .py file
Code works fine on personal computer.
FIX ATTEMPTS:
1. py_db connection seems fine, able to run py_db.py script no problem
(DOUBLE CHECK BY RUNNING BASIC SQL QUERY)
2. Tried removing initial code causing error; another syntax error; and another...
Said 'if' statement was syntax error, *sigh*.
3. Code works fine via pc; something missing in VM? Interpreter perhaps?
NEXT STEPS: 
- DOUBLE CHECK PY-DB CONNECTION WITH SIMPLE SQL QUERY! query works.
- TEST BY CREATING MINI FLASK APP. flask app works; renders add_book page successfully
- LOOK INTO PYTHON INTERPRETERS/VENV & RUNNING PYTHON IN VM!

SOLUTION:
- Error was 'f-strings'. Only compatible with Python 3.6 upwards. 
- python3 starts at 3.5.2 by default.
- SOLVED by reverting to classic .format() method!!!

LEARNING CURVE: ALWAYS CHECK SOFTWARE VERSIONING. STANDARDISE VERSION ACROSS MACHINES.


# Configuring Ansible Controller 


Installing Ansible on Ubuntu VM:
- Very simple just follow ansible documentation.

Assigning nodes to control is done in /etc/ansible/hosts file.

###########################
TIP: You can execute commands in VM from localhost via ssh (see below)

 SYNTAX: `ssh -i <path to key> <user>@<host_ip> <command>`
- `ssh -i /Users/user/code/Website_Project/VM/.vagrant/machines/ansible/virtualbox/private_key vagrant@192.168.10.100 hostname`
- This command would output the hostname --> ubuntu-xenial
###########################
