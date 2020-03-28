source : https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql

## Create a new user
```
$ mysql -u root
mysql > CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
mysql > GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
mysql > FLUSH PRIVILEGES;
```

## How To Grant Different User Permissions

Here is a short list of other common possible permissions that users can enjoy.

- ALL PRIVILEGES- as we saw previously, this would allow a MySQL user full access to a designated database (or if no database is selected, global access across the system)
- CREATE- allows them to create new tables or databases
- DROP- allows them to them to delete tables or databases
- DELETE- allows them to delete rows from tables
- INSERT- allows them to insert rows into tables
- SELECT- allows them to use the `SELECT` command to read through databases
- UPDATE- allow them to update table rows
- GRANT OPTION- allows them to grant or remove other users’ privileges

To provide a specific user with a permission, you can use this framework:

```
mysql > GRANT type_of_permission ON database_name.table_name TO ‘username’@'localhost’;
```
    

If you want to give them access to any database or to any table, make sure to put an asterisk (\*) in the place of the database name or table name.

Each time you update or change a permission be sure to use the Flush Privileges command.

If you need to revoke a permission, the structure is almost identical to granting it:
```
mysql > REVOKE type_of_permission ON database_name.table_name FROM ‘username’@‘localhost’;
```

Note that when revoking permissions, the syntax requires that you use `FROM`, instead of `TO` as we used when granting permissions.

You can review a user’s current permissions by running the following:
```
mysql > SHOW GRANTS username;
```

Just as you can delete databases with DROP, you can use DROP to delete a user altogether:
```
mysql > DROP USER ‘username’@‘localhost’;
```

To test out your new user, log out by typing:
```
mysql > quit
```

and log back in with this command in terminal:
```
$ mysql -u [username] -p
```
