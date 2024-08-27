#!/bin/bash
source .env
docker exec ds-mariadb sh -c "mariadb -u root -p${MARIADB_ROOT_PASSWORD} < /docker-entrypoint-initdb.d/1.sql"