#!/bin/bash
# a simple script that queries the Check_MK Livestatus database
# and retrieves the lists of systems that are down and sorts it
lq  "GET hosts\nFilter: state > 0\nColumns: name" | sort -u
