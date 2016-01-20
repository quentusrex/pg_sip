-- Create table
-- Insert Several example sip packets into table
-- Call functions retrieving specific values from packets in table

CREATE TABLE sip_packets (
       id    		 int,
       dialog 		 int,
       packet 		 text
);

CREATE OR REPLACE FUNCTION pg_sip_header_first(text, text)
    RETURNS text
    AS 'pg_sip', 'pg_sip_header_first'
    LANGUAGE C IMMUTABLE STRICT;


--------------
-- REGISTER --
--------------
INSERT INTO sip_packets (id, dialog, packet) VALUES (
       1,
       1,
       E'REGISTER sip:172.18.101.166 SIP/2.0\r\n' ||
       E'Via: SIP/2.0/UDP 172.18.100.211:5070;rport;branch=z9hG4bK1745718097\r\n' ||
       E'From: <sip:1001@172.18.101.166:5050>;tag=784732597\r\n' ||
       E'To: <sip:1001@172.18.101.166:5050>\r\n' ||
       E'Call-ID: 1101334158\r\n' ||
       E'CSeq: 1 REGISTER\r\n' ||
       E'Contact: <sip:1001@172.18.100.211:5070;line=67b868dc9445afc>\r\n' ||
       E'Max-Forwards: 70\r\n' ||
       E'User-Agent: Linphone/3.5.2 (eXosip2/3.6.0)\r\n' ||
       E'Expires: 3600\r\n' ||
       E'Content-Length: 0\r\n\r\n'
);

INSERT INTO sip_packets (id, dialog, packet) VALUES (
       2,
       1,
       'SIP/2.0 401 Unauthorized
        Via: SIP/2.0/UDP 172.18.100.211:5070;rport=5070;branch=z9hG4bK1745718097
        From: <sip:1001@172.18.101.166:5050>;tag=784732597
        To: <sip:1001@172.18.101.166:5050>;tag=6Fpm10FQKHDZg
        Call-ID: 1101334158
        CSeq: 1 REGISTER
        User-Agent: FreeSWITCH-mod_sofia/1.4.20+git~20150701T175516Z~39d0797abe~64bit
        Allow: INVITE, ACK, BYE, CANCEL, OPTIONS, MESSAGE, INFO, UPDATE, REGISTER, REFER, NOTIFY, PUBLISH, SUBSCRIBE
        Supported: timer, path, replaces
        WWW-Authenticate: Digest realm="172.18.101.166", nonce="37c5ae88-bf02-11e5-8d8d-ab39b71887b8", algorithm=MD5, qop="auth"
        Content-Length: 0
	'
);

INSERT INTO sip_packets (id, dialog, packet) VALUES (
       3,
       1,
       'REGISTER sip:172.18.101.166 SIP/2.0
        Via: SIP/2.0/UDP 172.18.100.211:5070;rport;branch=z9hG4bK1076768439
        From: <sip:1001@172.18.101.166:5050>;tag=784732597
        To: <sip:1001@172.18.101.166:5050>
        Call-ID: 1101334158
        CSeq: 2 REGISTER
        Contact: <sip:1001@172.18.100.211:5070;line=67b868dc9445afc>
        Authorization: Digest username="1001", realm="172.18.101.166", nonce="37c5ae88-bf02-11e5-8d8d-ab39b71887b8", uri="sip:172.18.101.166", response="a7e6cec977ef244269ae82db59262adb", algorithm=MD5, cnonce="0a4f113b", qop=auth, nc=00000001
        Max-Forwards: 70
        User-Agent: Linphone/3.5.2 (eXosip2/3.6.0)
        Expires: 3600
        Content-Length: 0
	'
);

INSERT INTO sip_packets (id, dialog, packet) VALUES (
       4,
       1,
       'SIP/2.0 200 OK
        Via: SIP/2.0/UDP 172.18.100.211:5070;rport=5070;branch=z9hG4bK1076768439
        From: <sip:1001@172.18.101.166:5050>;tag=784732597
        To: <sip:1001@172.18.101.166:5050>;tag=7rFD3U0tgt3Hc
        Call-ID: 1101334158
        CSeq: 2 REGISTER
        Contact: <sip:1001@172.18.100.211:5070;line=67b868dc9445afc>;expires=3600
        Date: Tue, 19 Jan 2016 23:13:15 GMT
        User-Agent: FreeSWITCH-mod_sofia/1.4.20+git~20150701T175516Z~39d0797abe~64bit
        Allow: INVITE, ACK, BYE, CANCEL, OPTIONS, MESSAGE, INFO, UPDATE, REGISTER, REFER, NOTIFY, PUBLISH, SUBSCRIBE
        Supported: timer, path, replaces
        Content-Length: 0
	'
);

INSERT INTO sip_packets (id, dialog, packet) VALUES (
       5,
       1,
       'NOTIFY sip:1001@172.18.100.211:5070;line=67b868dc9445afc SIP/2.0
        Via: SIP/2.0/UDP 172.18.101.166:5050;rport;branch=z9hG4bKpK7N7U13eQ31e
        Max-Forwards: 70
        From: <sip:1001@172.18.101.166>;tag=81854pHyD3S4Q
        To: <sip:1001@172.18.101.166>
        Call-ID: 0f2b1f87-39a5-1234-4a8c-086266314d0d
        CSeq: 86286533 NOTIFY
        Contact: <sip:mod_sofia@172.18.101.166:5050>
        User-Agent: FreeSWITCH-mod_sofia/1.4.20+git~20150701T175516Z~39d0797abe~64bit
        Allow: INVITE, ACK, BYE, CANCEL, OPTIONS, MESSAGE, INFO, UPDATE, REGISTER, REFER, NOTIFY, PUBLISH, SUBSCRIBE
        Supported: timer, path, replaces
        Event: message-summary
        Allow-Events: talk, hold, conference, presence, as-feature-event, dialog, line-seize, call-info, sla, include-session-description, presence.winfo, message-summary, refer
        Subscription-State: terminated;reason=noresource
        Content-Type: application/simple-message-summary
        Content-Length: 66

        Messages-Waiting: no
        Message-Account: sip:1001@172.18.101.166'
);

INSERT INTO sip_packets (id, dialog, packet) VALUES (
       6,
       1,
       'SIP/2.0 501 Not Implemented
        Via: SIP/2.0/UDP 172.18.101.166:5050;rport=5050;branch=z9hG4bKpK7N7U13eQ31e
        From: <sip:1001@172.18.101.166>;tag=81854pHyD3S4Q
        To: <sip:1001@172.18.101.166>;tag=269414044
        Call-ID: 0f2b1f87-39a5-1234-4a8c-086266314d0d
        CSeq: 86286533 NOTIFY
        User-Agent: Linphone/3.5.2 (eXosip2/3.6.0)
        Content-Length: 0
	'
);

---------------------------
-- SIP Call into Conference
---------------------------
INSERT INTO sip_packets (id, dialog, packet) VALUES (
       7,
       2,
       'INVITE sip:30012@172.18.101.166:5070 SIP/2.0
        Via: SIP/2.0/UDP 172.18.100.211:5070;rport;branch=z9hG4bK2134033631
        From: <sip:1001@172.18.101.166:5050>;tag=1653368073
        To: <sip:30012@172.18.101.166:5070>
        Call-ID: 1142287623
        CSeq: 20 INVITE
        Contact: <sip:1001@172.18.100.211:5070>
        Content-Type: application/sdp
        Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, NOTIFY, MESSAGE, SUBSCRIBE, INFO
        Max-Forwards: 70
        User-Agent: Linphone/3.5.2 (eXosip2/3.6.0)
        Subject: Phone call
        Content-Length:   315

        v=0
        o=1001 2148 2148 IN IP4 172.18.100.211
        s=Talk
	c=IN IP4 172.18.100.211
	t=0 0
	m=audio 7078 RTP/AVP 112 111 110 3 0 8 101
	a=rtpmap:112 speex/32000
	a=fmtp:112 vbr=on
	a=rtpmap:111 speex/16000
	a=fmtp:111 vbr=on
	a=rtpmap:110 speex/8000
	a=fmtp:110 vbr=on
	a=rtpmap:101 telephone-event/8000
	a=fmtp:101 0-11'
);

INSERT INTO sip_packets (id, dialog, packet) VALUES (
       8,
       2,
       'SIP/2.0 100 Trying
        Via: SIP/2.0/UDP 172.18.100.211:5070;rport=5070;branch=z9hG4bK2134033631
	From: <sip:1001@172.18.101.166:5050>;tag=1653368073
	To: <sip:30012@172.18.101.166:5070>
	Call-ID: 1142287623
	CSeq: 20 INVITE
	User-Agent: FreeSWITCH-mod_sofia/1.4.20+git~20150701T175516Z~39d0797abe~64bit
	Content-Length: 0
	'		       
);

INSERT INTO sip_packets (id, dialog, packet) VALUES (
       9,
       2,
       'SIP/2.0 200 OK
        Via: SIP/2.0/UDP 172.18.100.211:5070;rport=5070;branch=z9hG4bK2134033631
        From: <sip:1001@172.18.101.166:5050>;tag=1653368073
        To: <sip:30012@172.18.101.166:5070>;tag=4veFmpN99vB1m
        Call-ID: 1142287623
        CSeq: 20 INVITE
        Contact: <sip:30012@172.18.101.166:5070;transport=udp>
        User-Agent: FreeSWITCH-mod_sofia/1.4.20+git~20150701T175516Z~39d0797abe~64bit
        Accept: application/sdp
        Allow: INVITE, ACK, BYE, CANCEL, OPTIONS, MESSAGE, INFO, UPDATE, REGISTER, REFER, NOTIFY
        Supported: timer, path, replaces
        Allow-Events: talk, hold, conference, refer
        Content-Type: application/sdp
        Content-Disposition: session
        Content-Length: 223
        Remote-Party-ID: "30012" <sip:30012@172.18.101.166>;party=calling;privacy=off;screen=no

        v=0
        o=FreeSWITCH 1453221670 1453221671 IN IP4 172.18.101.166
        s=FreeSWITCH
	c=IN IP4 172.18.101.166
	t=0 0
	m=audio 23806 RTP/AVP 3 101
	a=rtpmap:3 GSM/8000
	a=rtpmap:101 telephone-event/8000
	a=fmtp:101 0-16
	a=ptime:20'
);

INSERT INTO sip_packets (id, dialog, packet) VALUES (
       10,
       2,
       'ACK sip:30012@172.18.101.166:5070;transport=udp SIP/2.0
	Via: SIP/2.0/UDP 172.18.100.211:5070;rport;branch=z9hG4bK959542320
	From: <sip:1001@172.18.101.166:5050>;tag=1653368073
	To: <sip:30012@172.18.101.166:5070>;tag=4veFmpN99vB1m
	Call-ID: 1142287623
	CSeq: 20 ACK
	Contact: <sip:1001@172.18.100.211:5070>
	Max-Forwards: 70
	User-Agent: Linphone/3.5.2 (eXosip2/3.6.0)
	Content-Length: 0
	'
);

INSERT INTO sip_packets (id, dialog, packet) VALUES (
       11,
       2,
       'BYE sip:30012@172.18.101.166:5070;transport=udp SIP/2.0
	Via: SIP/2.0/UDP 172.18.100.211:5070;rport;branch=z9hG4bK1686375066
	From: <sip:1001@172.18.101.166:5050>;tag=1653368073
	To: <sip:30012@172.18.101.166:5070>;tag=4veFmpN99vB1m
	Call-ID: 1142287623
	CSeq: 21 BYE
	Contact: <sip:1001@172.18.100.211:5070>
	Max-Forwards: 70
	User-Agent: Linphone/3.5.2 (eXosip2/3.6.0)
	Content-Length: 0
	'
);

INSERT INTO sip_packets (id, dialog, packet) VALUES (
       12,
       2,
       'SIP/2.0 200 OK
	Via: SIP/2.0/UDP 172.18.100.211:5070;rport=5070;branch=z9hG4bK1686375066
	From: <sip:1001@172.18.101.166:5050>;tag=1653368073
	To: <sip:30012@172.18.101.166:5070>;tag=4veFmpN99vB1m
	Call-ID: 1142287623
	CSeq: 21 BYE
	User-Agent: FreeSWITCH-mod_sofia/1.4.20+git~20150701T175516Z~39d0797abe~64bit
	Allow: INVITE, ACK, BYE, CANCEL, OPTIONS, MESSAGE, INFO, UPDATE, REGISTER, REFER, NOTIFY
	Supported: timer, path, replaces
	Content-Length: 0
	'
);

select pg_sip_header_first(packet, 'To'::text) from sip_packets where id = 1;
select pg_sip_header_first(packet, 'Via'::text) from sip_packets where id = 1;
select pg_sip_header_first(packet, 'ViaBad'::text) from sip_packets where id = 1;

