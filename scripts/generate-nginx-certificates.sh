#!/bin/bash -e

WORKDIR=${PWD}
CERTIFICATESDIR=${WORKDIR}/docker/nginx/dev/certs

source "$WORKDIR"/docker/.env

./scripts/utils/validate-application-name-from-input.sh "$1"

source "$WORKDIR"/scripts/utils/set-application-data-by-application-name.sh "$1"

mkcert -key-file "$CERTIFICATESDIR"/"$1"-key.pem -cert-file "$CERTIFICATESDIR"/"$1"-cert.pem "$DOMAIN" localhost 127.0.0.1 ::1