CREATE FUNCTION pg_sip_version()
RETURNS text
AS '$libdir/pg_sip'
LANGUAGE C IMMUTABLE STRICT;
