#!/bin/bash
SERVER=myhost.mydomain
SITE=mysite
NEWHOST=$1
curl "http://${SERVER}/${SITE}/check_mk/webapi.py?action=discover_services&_username=automation&_secret=XXXXXX-0112-4988-a4b5-7f0e9bc09265" -d 'request={"hostname":"'${NEWHOST}'"}'
