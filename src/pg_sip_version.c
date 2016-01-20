#include <postgres.h>
#include <fmgr.h>
#include "utils/builtins.h"
#include <re/re_sa.h>
#include <re/re_fmt.h>
#include <re/re_list.h>
#include <re/re_uri.h>
#include <re/re_msg.h>
#include <re/re_sip.h>

#ifdef PG_MODULE_MAGIC
PG_MODULE_MAGIC;
#endif

Datum pg_sip_version(PG_FUNCTION_ARGS);

PG_FUNCTION_INFO_V1(pg_sip_version);

Datum
pg_sip_version(PG_FUNCTION_ARGS)
{
  sip_msg_dump(NULL);
  PG_RETURN_TEXT_P(cstring_to_text("0.0.1"));
}
