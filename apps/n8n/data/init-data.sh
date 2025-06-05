#!/bin/bash
set -e;

if [ -n "${POSTGRES_NON_ROOT_USER:-}" ] && [ -n "${POSTGRES_NON_ROOT_PASSWORD:-}" ]; then
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- 1) Install uuid-ossp under the superuser
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

    -- 2) Create the non-root “n8n” role
    CREATE USER ${POSTGRES_NON_ROOT_USER} WITH PASSWORD '${POSTGRES_NON_ROOT_PASSWORD}';

    -- 3) Grant it rights on the database itself
    GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_DB} TO ${POSTGRES_NON_ROOT_USER};

    -- ===== Option B: leave `public` owned by superuser, but grant only CREATE/USAGE =====
    GRANT USAGE ON SCHEMA public TO ${POSTGRES_NON_ROOT_USER};
    GRANT CREATE ON SCHEMA public TO ${POSTGRES_NON_ROOT_USER};

    -- (Option A—re-owning public—is commented out to enforce least-privilege)
    -- ALTER SCHEMA public OWNER TO ${POSTGRES_NON_ROOT_USER};
    -- GRANT ALL ON SCHEMA public TO ${POSTGRES_NON_ROOT_USER};
  EOSQL
else
  echo "SETUP INFO: No Environment variables given!"
fi
