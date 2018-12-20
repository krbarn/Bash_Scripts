for i in $(for i in $(./hosts_down.sh ); do nslookup $i |grep "can't" ; done | awk '{print $5}' | awk -F: '{print $1}')
do
echo $i
/dept/uss/bin/cmk_delete_host.sh $i
done

