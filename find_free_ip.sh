#!/bin/bash
# handy little script to find the free ip addresses in a subnet

CIDR=$1
NUMBITS=$2
#echo "nmap -v -sn -n ${CIDR}/${NUMBITS} -oG - | awk '/Status Down/{print $2}'"
nmap -v -sn -n ${CIDR}/${NUMBITS} -oG - | awk '/Status Down/{print $2}'
