# Use an official lightweight alpine image as a base image
FROM alpine:latest

# Install SQLite
RUN apk add --no-cache sqlite

# Set the volume for the database file
VOLUME [ "/database" ]

# Default command to run SQLite CLI
CMD ["sqlite3", "/database/mydatabase.db"]