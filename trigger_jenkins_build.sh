#!/bin/bash
#
# trigger_jenkins_job.sh
# this script assumes you have a .netrc entry to the jenkins server osijml01 setup already
#

curl -k -n -H "Jenkins-Crumb:c5338d1b4de6b570e67c5a1163b0b724" -X POST "https://osijml01.unx.sas.com/job/Run Ansible Playbook/buildWithParameters?ANSPLAYBOOK=check_mk_registration.yml&HOSTLIST=ossadm01.unx.sas.com"