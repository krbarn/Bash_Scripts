#!/bin/bash
#
# trigger_jenkins_job.sh
# this script assumes you have a .netrc entry to the jenkins server osijml01 setup already
#

curl -k -n  \
<<<<<<< HEAD
	-H "Jenkins-Crumb:XXXXXXXXXXXXXXXXX" \
=======
	-H "Jenkins-Crumb:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
>>>>>>> some minor updates
	-X POST "https://jenkins_master/job/Run Ansible Playbook/buildWithParameters?ANSPLAYBOOK=playbook.yml&HOSTLIST=test.barnhouse.com"
