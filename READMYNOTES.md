# Migrating App/DB onto VM

- When running flask remember to specify host ip as the remote server ip. 
By defualt, Flask hosts web app on localhost.
E.g.

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
- TEST BY CREATING MINI FLASK APP 
- LOOK INTO PYTHON INTERPRETERS/VENV & RUNNING PYTHON IN VM!
