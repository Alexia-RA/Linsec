#!/bin/bash

echo "#!/bin/bash

	declare -a disks=($(df -h | cut -d " " -f 1 | sort | uniq))" > disk.sh


echo 'while true
do

	declare -a disks=($(df -h | cut -d " " -f 1 | sort | uniq))



	for x in ${disks[@]}
	do
		checkdisk=$(echo $check | grep $x)
		if [ "$checkdisk" == "" ]
		then
			log=$(grep -w $x /var/log/linsec.log)
			if [ "$log" == "" ]
			then
				echo "disco $x sin autorización" >> /var/log/linsec.log
			fi
			umount $x 2> /dev/null
		fi
	done


	sleep 5
	break

done' >> disk.sh
