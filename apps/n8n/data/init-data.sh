#!/bin/bash
set -e;

# Create the extension as the superuser (POSTGRES_USER)
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
EOSQL

echo "INFO: Successfully created 'uuid-ossp' extension if it didn't exist."

# Now, create the non-root user and grant privileges
if [ -n "${POSTGRES_NON_ROOT_USER:-}" ] && [ -n "${POSTGRES_NON_ROOT_PASSWORD:-}" ]; then
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
		CREATE USER ${POSTGRES_NON_ROOT_USER} WITH PASSWORD '${POSTGRES_NON_ROOT_PASSWORD}';
		GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_DB} TO ${POSTGRES_NON_ROOT_USER};

		-- Grant CREATE and USAGE on the public schema to the non-root user
		-- This allows the user to create tables in the public schema.
		GRANT CREATE, USAGE ON SCHEMA public TO ${POSTGRES_NON_ROOT_USER};

		-- It's also good practice to grant usage on the public schema explicitly, (This line is now covered by the line above)
		-- where extensions like uuid-ossp typically install their functions.
		-- GRANT USAGE ON SCHEMA public TO ${POSTGRES_NON_ROOT_USER}; -- Redundant if CREATE, USAGE is granted above

		GRANT SELECT ON ALL TABLES IN SCHEMA public TO ${POSTGRES_NON_ROOT_USER}; -- If n8n needs to read pg_catalog or other system tables in public
		GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO ${POSTGRES_NON_ROOT_USER}; -- To use functions from the extension
	EOSQL
	echo "INFO: Successfully created non-root user '${POSTGRES_NON_ROOT_USER}' and granted privileges."
else
	echo "SETUP INFO: No POSTGRES_NON_ROOT_USER or POSTGRES_NON_ROOT_PASSWORD environment variables given!"
fi
