#!/bin/bash
set -e

# Enhanced logging
echo "Starting PostgreSQL initialization..."

if [ -n "${POSTGRES_NON_ROOT_USER:-}" ] && [ -n "${POSTGRES_NON_ROOT_PASSWORD:-}" ]; then
    echo "Creating non-root user: ${POSTGRES_NON_ROOT_USER}"
    
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        DO \$\$
        BEGIN
            IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = '${POSTGRES_NON_ROOT_USER}') THEN
                CREATE USER ${POSTGRES_NON_ROOT_USER} WITH PASSWORD '${POSTGRES_NON_ROOT_PASSWORD}';
            END IF;
        END
        \$\$;
        
        GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_DB} TO ${POSTGRES_NON_ROOT_USER};
        GRANT ALL PRIVILEGES ON SCHEMA public TO ${POSTGRES_NON_ROOT_USER};
        GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ${POSTGRES_NON_ROOT_USER};
        GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO ${POSTGRES_NON_ROOT_USER};
        ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO ${POSTGRES_NON_ROOT_USER};
        ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO ${POSTGRES_NON_ROOT_USER};
EOSQL
    
    echo "Successfully created and configured user: ${POSTGRES_NON_ROOT_USER}"
else
    echo "WARNING: No environment variables provided for non-root user creation!"
fi

echo "PostgreSQL initialization completed."
