#!/bin/bash


echo "#!/bin/bash" > $z.sh

#Variables


declare -a scripts=(rw disk net proc x11 sysctl)
declare -a hashscr=()
declare -a hashser=()
script="/usr/local/bin/linsec"
servicio="/etc/systemd/system"


echo '#Variables
declare -a scripts=(rw disk net proc x11 sysctl)
script="/usr/local/bin/linsec"
servicio="/etc/systemd/system"
while true
do
c=0' >> $z.sh


#Identificar hash original

for x in ${scripts[@]}
do
	if [ "$x" != "x11" ] && [ "$x" != "sysctl" ]
	then
		hashscr+=($(md5sum $script/$x | cut -d " " -f 1))
	fi
	hashser+=($(md5sum $servicio/$x.service | cut -d " " -f 1))
done

echo "declare -a hashscr=(${hashscr[@]})
declare -a hashser=(${hashser[@]})" >> $z.sh


echo 'for x in ${scripts[@]}
do
	if [ "$x" != "x11" ] && [ $x != "sysctl" ]
	then
		check=$(md5sum $script/$x | cut -d " " -f 1)
		if [ "$check" != "${hashscr[$c]}" ]
		then
			init 0
		fi
	fi

	check=$(md5sum $servicio/$x.service | cut -d " " -f 1)
	if [ "$check" != "${hashser[$c]}" ]
	then
		init 0
	fi
	if [ "$(systemctl is-enabled $x)" != "enabled" ] 2>/dev/null
	then
		init 0
	fi

	if [ "$x" != "rw" ]
	then
		if [ "$(systemctl is-active $x)" != "active" ] 2>/dev/null
		then
			init 0
		fi
	fi
	let c=$c+1
done
done' >> $z.sh
