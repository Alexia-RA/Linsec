Lea esto para saber qué debe hacer para configurar linsec

1. Asegurese de tener el sistema preparado

1- Necesitará una vpn que se active con un servicio llamado vpn, las ips que tengan sus servidores que incluyan linsec dentro de la vpn deberán indicarse en un fichero llamado ips que debes crear, este fichero se eliminará para encubrir que ips están conectadas, puede copiar este fichero en todos sus servidores para no tener que escribirlo varias veces

2- Todos los servidores deben tener acceso entre sí mediante clave RSA

3- Necesitará instalar los siguientes programas:
- shc
- gcc
- md5sum
- netcat
- sshpass
- net-tools
- mysql-server


2. Para ejecutar linsec inicie todos los programas que vaya a usar, ya sean un navegador, un servidor dns o cualquier otra, todo lo que vaya a usar debe estar activo al momento de ejecutar linsec


3. Antes de la ejecución del fichero linsec ejecute create.sql para crear la base de datos y las tablas

4. Con todo esto finalizado, ejecute linsec y seleccione las funciones opcionales en base a las preguntas que le haga el programa


En caso de querer eliminar el programa pongase en contacto con el desarrollador para que se lo desactive, si no se hace de la forma correcta se arriesga a dificultar más la desactivación del programa
