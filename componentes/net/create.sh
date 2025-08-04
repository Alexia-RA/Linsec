#!/bin/bash

#Puertos usados
echo "Escriba los números de los puertos que quiere controlar con espacios entre sí"
read usedports


echo "#!/bin/bash
#Variables
declare -a ipc=($(cat ips | cut -d " " -f 1))
declare -a portc=($(cat ips | cut -d " " -f 2))
declare -a usedports=($(echo $usedports))" > net.sh
rm ips

echo 'while true
do
v=0
c=1
declare -a ip=($(netstat -tupn | tr -s " " " " | cut -d " " -f 5 | cut -d ":" -f 1))
declare -a port=($(netstat -tupn | tr -s " " " " | cut -d " " -f 4 | cut -d ":" -f 2))
declare -a pid=($(netstat -tupn | tr -s " " " " | cut -d " " -f 7 | cut -d "/" -f 1))







for x in ${ip[@]}
do
	if [ "$v" -gt 1 ]
	then
		check=$(echo ${usedports[@]} | grep ${port[$v]})
		if [ "$check" != "" ]
		then
			c2=0
			ok=no
			for z in ${ipc[@]}
			do
				if [ "x" == "$z" ] && [ "${port[$v]}" == "${portc[$c2]}" ]
				then
					ok=yes
				fi
				let c2=$c2+1
			done

			if [ "$ok" != "yes" ]
			then
				echo "kill ${pid[$c]}"
			fi
		fi
		let c=$c+1
	fi
	let v=$v+1
done
sleep 5
done' >> net.sh
