#!/bin/bash
set -e;

if [ -n "${POSTGRES_NON_ROOT_USER:-}" ] && [ -n "${POSTGRES_NON_ROOT_PASSWORD:-}" ]; then
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- 1) Ensure uuid-ossp is installed under the superuser
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

    -- 2) Create the non-root “n8n” user
    CREATE USER ${POSTGRES_NON_ROOT_USER} WITH PASSWORD '${POSTGRES_NON_ROOT_PASSWORD}';

    -- 3) Grant the “n8n” user rights on the database itself
    GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_DB} TO ${POSTGRES_NON_ROOT_USER};

    -- 4) Option B: leave `public` owned by superuser (tipi), but let “n8n” CREATE there
    GRANT USAGE ON SCHEMA public TO ${POSTGRES_NON_ROOT_USER};
    GRANT CREATE ON SCHEMA public TO ${POSTGRES_NON_ROOT_USER};

    -- (We intentionally do NOT alter schema ownership here, so “n8n” cannot drop/alter existing objects.)
  EOSQL
else
  echo "SETUP INFO: No Environment variables given!"
fi
