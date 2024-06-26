#!/bin/bash

usage() { echo "Usage: $0 [-d <dry run>] [-D <domain>]" 1>&2; exit 1; }

dry_run=""
domain=""

while getopts ":d:D" o; do
    case "${o}" in
        d)
            dry_run="--dry-run"
            ;;
        D)
            domain=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${domain}" ]; then
    usage
fi

docker compose run --rm certbot certonly\
    --webroot\
    --webroot-path /var/www/certbot/\
    $dry_run\
    -d $domain
