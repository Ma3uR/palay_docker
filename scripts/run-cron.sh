#!/bin/bash
## Usage: ./scripts/recreate-profile-indexes.sh Cli:SomeCommand:SomeCommand

WORKDIR=${PWD}
source "$WORKDIR"/docker/.env

docker_container="$COMPANY_NAME-$SK3_APPLICATION_NAME-app"
php_command="php $INDEX_PHP_PATH $1"

cd "$DOCKER_COMPOSE_DIR" || exit 1

# make sure that all containers are good.
docker-compose up -d

fifo_file=$(mktemp -u)
mkfifo "$fifo_file"
pv "$fifo_file" | docker exec -i "$docker_container" bash -c "$php_command" &


echo "Some data to pass to PHP command" > "$fifo_file"


rm "$fifo_file"

echo "Docker exec command started."



