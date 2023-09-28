# CIS395 SQLite Labs

## 1. Run and stop the Docker container

```bash
# Build the docker image
$ docker-compose build

# Start the docker container
$ docker-compose up -d

# Stop the docker container
$ docker-compose down
```

## 2. Interact with SQLite

```bash
$ docker-compose exec sqlite sqlite3 /database/mydatabase.db
```

- `docker-compose exec`: Allows you to run commands in a service container.
- `sqlite`: This is the name of the service we're targeting (from your docker-compose.yml).
- `sqlite3 /database/mydatabase.db`: This is the command we want to run inside the service container.

## 3. SQLite common commands

### Show Databases

SQLite is a serverless, file-based, and lightweight SQL database engine.
SQLite doesn't have the concept of multiple databases like MySQL or PostgreSQL. Instead, each SQLite database is a standalone file.

```bash
# Show the current database file's path
sqlite> .database
main: /database/mydatabase.db r/w

# List the main database and any attached databases
sqlite> .databases
main: /database/mydatabase.db r/w
```

### Show Tables

```bash
# Show all tables in the current database
sqlite> .tables
```

### Show Schema

```bash
# Show the schema of a table
sqlite> .schema <table_name>
```

### Show Settings

```bash
# Show the current settings
sqlite> .show
        echo: off
         eqp: off
     explain: auto
     headers: off
        mode: list
   nullvalue: ""
      output: stdout
colseparator: "|"
rowseparator: "\n"
       stats: off
       width: 
    filename: /database/mydatabase.db
```

### Exit

```bash
# Exit the sqlite3 shell
sqlite> .exit

# Or
sqlite> .quit
```
