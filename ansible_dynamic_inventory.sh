#! /bin/bash

if [ "$1" == "--list" ]; then
cat<<EOF
{
  "linux": {
    "hosts": [
EOF

for i in $( percentgroup -l "Unix Sysconfig Sudoers Primary")
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
