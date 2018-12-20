#!/bin/bash
echo $1
SERVER=myhost.mydomain
SITE=mysite
NEWHOST=$1
curl "http://${SERVER}/${SITE}/check_mk/webapi.py?action=add_host&_username=automation&_secret=0e3f1baf-0112-4988-a4b5-7f0e9bc09265" -d   'request={"attributes":{ "tag_agent": "cmk-agent" }, "hostname":"'${NEWHOST}'","folder":"linux"}'

curl "http://${SERVER}/${SITE}/check_mk/webapi.py?action=discover_services&_username=automation&_secret=0e3f1baf-0112-4988-a4b5-7f0e9bc09265" -d 'request={"hostname":"'${NEWHOST}'"}'
