#!/bin/bash
set -e

# Wait for the database to be ready
echo "Waiting for database..."
while ! nc -z db 5432; do
  sleep 3
done

# Run database migrations
echo "Running migrations..."
bundle exec rake db:migrate

# Start the Rails server
exec "$@"