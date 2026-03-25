#!/bin/bash
set -e

# flags_db já foi criado pelo POSTGRES_DB. Cria targeting_db.
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -c "CREATE DATABASE targeting_db;"

# Inicializa o schema do flag-service em flags_db
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "flags_db" -f /init-sql/flags.sql

# Inicializa o schema do targeting-service em targeting_db
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "targeting_db" -f /init-sql/targeting.sql
