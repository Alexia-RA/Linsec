#!/bin/bash

#Variables

declare -a scripts=(rw disk net proc)

script="/usr/local/bin/linsec"
servicio="/etc/systemd/system/"



#Crear el script a ejecutar

#Crear variables

echo '#!/bin/bash
declare -a scripts=(rw disk net proc)
script="/usr/local/bin/linsec"
servicio="/etc/systemd/system/"' > linsec.sh

#Crear directorios
echo 'if [ ! -e "/usr/local/bin/linsec" ]
then
	mkdir /usr/local/bin/linsec/
fi' >> linsec.sh
#Crear scripts

for x in ${scripts[@]}
do
	nlin=$(wc -l ../$x/create.sh | cut -d " " -f 1)
	let nlin=$nlin-1
	tail -n $nlin ../$x/create.sh >> linsec.sh
done






#Crear servicios

echo 'for x in ${scripts[@]}
do
	echo "[Unit]
	After=network.target
	[Service]
	ExecStart=/usr/local/bin/linsec/$x
	[Install]
	WantedBy=default.target" > $servicio/$x.service

	shc -o $script/$x -f $x.sh
	chmod +x $script/$x
	rm $x*
	systemctl enable $x
	systemctl start $x
done' >> linsec.sh

#Crear comprobadores




#Crea los servicios


echo 'declare -a checkers=(x11 sysctl)
for x in ${checkers[@]}
do



echo "[Unit]
After=network.target
[Service]
ExecStart=/usr/sbin/$x
[Install]
WantedBy=default.target" > $servicio/$x.service
done

for z in ${checkers[@]}
do' >> linsec.sh

nlin=$(wc -l ../x11-sysctl/create.sh | cut -d " " -f 1)
let nlin=$nlin-1
tail -n $nlin ../x11-sysctl/create.sh >> linsec.sh


echo 'shc -o /usr/sbin/$z -f $z.sh
chmod +x /usr/sbin/$z
rm $x*
systemctl enable $z
systemctl start $z
done' >> linsec.sh
