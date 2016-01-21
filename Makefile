EXTENSION = pg_sip
DATA = pg_sip--0.0.1.sql
MODULE_big = pg_sip
OBJS	   = src/pg_sip_version.o src/pg_sip_header.o
REGRESS    = version header

PG_CPPFLAGS += -I$(shell pwd)/libs/libre/include/
SHLIB_LINK += $(srcdir)/libs/libre/libre.a

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

$(srcdir)/libs/libre/libre.a:
	make -C $(srcdir)/libs/libre/ libre.a

