#!/bin/bash

WORKDIR=${PWD}

source "$WORKDIR"/docker/.env

if [[ -z "$1" ]]
then
  echo 'ERROR: Application name is not set'
  exit 1
fi

if [[ ! ",$APPLICATION_NAMES," = *",$1,"* ]]
then
  echo 'ERROR: Application name must be one from this list' "$APPLICATION_NAMES"
  exit 1
fi