# CIS395 SQLite Labs

## Run and stop the Docker container

```bash
# Build the docker image
$ docker-compose build

# Start the docker container
$ docker-compose up -d

# Stop the docker container
$ docker-compose down
```

## Interact with SQLite

```bash
$ docker-compose exec sqlite sqlite3 /database/mydatabase.db
```

- `docker-compose exec`: Allows you to run commands in a service container.
- `sqlite`: This is the name of the service we're targeting (from your docker-compose.yml).
- `sqlite3 /database/mydatabase.db`: This is the command we want to run inside the service container.
