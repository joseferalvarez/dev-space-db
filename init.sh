#!/bin/sh
source .env
docker exec mariadb sh -c "mariadb -u root -p${MARIADB_ROOT_PASSWORD} < /docker-entrypoint-initdb.d/1.sql"