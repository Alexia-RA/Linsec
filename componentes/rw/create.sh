#!/bin/bash

#Formatear claves RSA
function keys {
	root
	usussh
}

function root {
	auth="'$(cat /root/.ssh/authorized_keys)"
	echo "#!/bin/bash
	echo $auth' > /root/.ssh/authorized_keys" > rw.sh
}

function usussh {
	echo "¿Quiere agregar algún usuario para conexiones ssh con rsa? S/N"
	read usercheck
	if [ "$usercheck" == "S" ]
	then
		usuadd
	fi
}

function usuadd {
	echo "Escriba el nombre del usuario a agregar"
	read usu
	auth="'$(cat /home/$usu/.ssh/authorized_keys)"
	echo "echo $auth' > /home/$usu/.ssh/authorized_keys" >> rw.sh
	usussh
}

keys



#Formatear archivos importantes
function files {
	declare -a files='(passwd shadow group shadow- sudoers)'
	for x in ${files[@]}
	do
		file="'$(cat /etc/$x)"
		echo "echo $file' > /etc/$x" >> rw.sh
	done
}
files
