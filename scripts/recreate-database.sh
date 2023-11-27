#!/bin/bash -e

WORKDIR=${PWD}

source "$WORKDIR"/docker/.env

./scripts/utils/validate-application-name-from-input.sh "$1"

source "$WORKDIR"/scripts/utils/set-application-data-by-application-name.sh "$1"

DATABASEDUMPSLOCATION=/docker-entrypoint-initdb.d/$1/dump.sql

docker exec -it "$COMPANY_NAME"-mariadb mysql -uroot -p"$MARIADB_ROOT_PASSWORD" -e "
    DROP DATABASE IF EXISTS $DATABASE_NAME;
    CREATE DATABASE $DATABASE_NAME;"

docker exec -ti "$COMPANY_NAME"-mariadb /bin/sh -c "pv $DATABASEDUMPSLOCATION | mysql -u root -p$MARIADB_ROOT_PASSWORD $DATABASE_NAME"
