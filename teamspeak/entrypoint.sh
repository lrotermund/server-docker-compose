#!/bin/sh

export TS3SERVER_DB_USER=$(cat /run/secrets/mariadb_user)
export TS3SERVER_DB_PASSWORD=$(cat /run/secrets/mariadb_pw)
export TS3SERVER_DB_NAME=$(cat /run/secrets/mariadb_database)

# Starten des TeamSpeak Servers
exec tini -- /entrypoint.sh ts3server start
