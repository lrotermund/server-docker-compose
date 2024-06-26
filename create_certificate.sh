#!/bin/bash

DRY_RUN="--dry-run"

usage() {
  echo "Usage: $0 --domain DOMAIN_NAME [--dry-run [true|false]]"
  exit 1
}

if [ $# -eq 0 ]; then
  usage
fi

while [ "$1" != "" ]; do
  case $1 in
    --domain )
      shift
      DOMAIN=$1
      ;;
    --dry-run )
      shift
      DRY_RUN=$1
      ;;
    * )
      usage
      ;;
  esac
  shift
done

if [ -z "$DOMAIN" ]; then
  echo "Error: Missing required argument '--domain'"
  usage
fi

docker compose run --rm certbot certonly\
    --webroot\
    --webroot-path /var/www/certbot/\
    $DRY_RUN\
    -d $DOMAIN
