#include <postgres.h>
#include <fmgr.h>
#include "utils/builtins.h"

#include <re/re.h>
/*
#include <re/re_sa.h>
#include <re/re_fmt.h>
#include <re/re_mbuf.h>
#include <re/re_list.h>
#include <re/re_uri.h>
#include <re/re_msg.h>
#include <re/re_sip.h>
*/

Datum pg_sip_header_first(PG_FUNCTION_ARGS);

PG_FUNCTION_INFO_V1(pg_sip_header_first);

Datum
pg_sip_header_first(PG_FUNCTION_ARGS)
{
  text *packet = PG_GETARG_TEXT_P(0);
  text *header = PG_GETARG_TEXT_P(1);
  struct sip_msg *msg = NULL;
  struct sip_hdr *hdr = NULL;
  struct mbuf *mb = mbuf_alloc(VARSIZE(packet));
  int err = 0;
  char *response = "failed";

  if ( VARSIZE(header) < 1 ) {
    elog(ERROR, "missign header value");
  }
  
  /* Get size of packet, allocate mbuf, copy/print from packet into mbuf. */
  mbuf_write_mem(mb, (const uint8_t *) VARDATA(packet), VARSIZE(packet) - VARHDRSZ);
  mbuf_set_pos(mb, 0);

  err = sip_msg_decode(&msg, mb);
  if ( err ) {
    /* Handle msg decode error */
    elog(ERROR, "could not determine data type of input %d EINVAL[%d] EBADMSG[%d]  ENODATA[%d]", err, EINVAL, EBADMSG, ENODATA);
  }

  hdr = sip_msg_xhdr(msg, VARDATA(header));

  if ( hdr ) {
    /* Construct a text response based on the header values returned val.p for string and val.l for length */
    PG_RETURN_TEXT_P(cstring_to_text(hdr->val.p));
  } else {
    PG_RETURN_TEXT_P(cstring_to_text(response));
  }
}
