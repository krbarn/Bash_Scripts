#!/bin/bash
SERVER=myhost.mydomain
SITE=mysite
curl "http://${SERVER}/${SITE}/check_mk/webapi.py?action=activate_changes&_username=automation&_secret=XXXXX" \
     -d 'request={"sites": ["mysite"]}'
