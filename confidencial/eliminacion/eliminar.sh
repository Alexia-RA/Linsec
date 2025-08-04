#!/bin/bash

#Variables
servicio="/etc/systemd/system"
script="/usr/local/bin/linsec"

#desactivamos y deshabilitamos todo, el primero x11 y sysctl, para poder proceder con la desactivación de todo lo demás



declare -a scripts=(x11 sysctl rw disk net proc)

for x in ${scripts[@]}
do
	systemctl stop $x
	systemctl disable $x
	rm $servicio/$x.service
	if [ "$x" == "sysctl" ] || [ "$x" == "x11" ]
	then
		rm /usr/sbin/$x
	else
		rm $script/$x
	fi
done
