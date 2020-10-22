#!/bin/bash
curl -v -H "Content-Type: application/json" -X POST --data @add_user.json -u saskrb https://passwd-api.unx.sas.com/v1/users
