EXTENSION = pg_sip
DATA = pg_sip--0.0.1.sql
MODULE_big = pg_sip
OBJS	   = src/pg_sip_version.o src/pg_sip_header.o
REGRESS    = version header

PG_CPPFLAGS += $(shell pkg-config --cflags libre)
SHLIB_LINK += $(shell pkg-config --libs libre)

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)


