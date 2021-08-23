#! /bin/bash
# 
# gen_perc_inventory - generate an ansible playbook from PERC entity groups
#

INVGRP="Unix Sysconfig Sudoers Primary"
if [ "$1" == "--list" ]; then
cat<<EOF
{
  "linux": {
    "hosts": [
EOF

for i in $( percentgroup -l "${INVGRP}")
do
	echo $i | awk '{printf "      \"%s\",\n",$1}'
done
cat<<EOF2
    ]
  }
}
EOF2

elif [ "$1" == "--host" ]; then
  echo '{"_meta": {hostvars": {}}}'
else
  echo "{ }"
fi
