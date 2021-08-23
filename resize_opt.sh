#!/usr/bin/vmsh
# script: resize_opt.sh
# usage
#

DEBUG=1
if [ -z $1 ]
then
    echo "usage: resize_opt.sh <hostname>"
    exit
else
    myvm=$1
    [ $DEBUG ] && echo "hostname: $myvm"
fi

# get the logical volume name and volume group /opt is mounted on
optlv=$(ssh root@$myvm df /opt | grep /opt |awk '{print $1}')
optvg=$(ssh root@$myvm lvs --nohead $optlv | awk '{print $2}')

[ $DEBUG ] && echo "system: $myvm"
[ $DEBUG ] && echo "volume group: $optvg"
[ $DEBUG ] && echo "logical volume: $optlv"



# get a list of the disk drives before adding a disk, add the disk, get the list of disk drives afterwards
ssh root@$myvm lsblk |grep disk |awk '{print $1}' > /tmp/disk_list_1.txt
# vmdiskaddgb 11 $myvm
ssh root@$myvm "echo \"- - -\" > /sys/class/scsi_host/host0/scan"
ssh root@$myvm lsblk |grep disk |awk '{print $1}' > /tmp/disk_list_2.txt

# determine the new disk drive added
newdisk=$(comm -13 /tmp/disk_list_1.txt /tmp/disk_list_2.txt)
rm /tmp/disk_list_1.txt
rm /tmp/disk_list_2.txt

[ $DEBUG ] && echo "new disk: $newdisk"

# add the disk to LVM, extend the volume group, and resize the /opt logical volume
#ssh root@$myvm pvcreate /dev/$newdisk
#ssh root@$myvm vgextend $optvg /dev/$newdisk
#ssh root@$myvm lvextend --resize --size +10G $optlv 
