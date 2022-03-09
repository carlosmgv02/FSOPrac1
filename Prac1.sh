#! /bin/bash
fil=0
cols=0
portSize=0

minFil=10
maxFil=120

minCol=8
maxCol=36

minPort=8
temp=fil
posFilaPal=0
posColPal=0

Nflag=''
Fflag=''
Cflag=''
Pflag=''

found='false'
function readFile
{
	#falta arreglar, sólo lee si hay 2 líneas en el archivo
	echo "Entra en 'readFile'"
	while IFS=' ' read -r fil cols portSize
	do
		echo "fils= $fil"
		echo "cols= $cols"
		echo "portSize= $portSize"
		exit
	done < $file
}
function writeFile
{
	n=0
	echo "$fil $col $portSize"
	
}
function comprobarfichero
{
	if [ -f $file ] && [ -e $file ]
	then
		echo "Existe el archivo '$file'"
		found='true'
	else
		echo "No existe el archivo $file, procedemos a crearlo"
		touch $file	#si no existe el fichero lo creamos
	fi
}

function readFromKeyboard
{
	read -p "Introduce el nombre del archivo que quieres usar: " file
	comprobarfichero
#FILAS
	read -p "Introduce el numero de filas: " fil
	if [ $fil -lt $minFil ] || [ $fil -gt $maxFil ] ; then
		echo "El numero introducido es incorrecto, 50 asignado por defecto"
		let fil=50
	else
		echo "Filas asignadas correctamente"
	fi
		let maxPort=fil-1
		#rows output
		truncate -s-1 file
		echo -n "$fil " > $file
#COLUMNAS
	read -p "Introduce el numero de columnas: " cols
	if [ $cols -lt $minCol ] || [ $cols -gt $maxCol ] ; then
		echo "El numero introducido es incorrecto, 20 asignado por defecto"
		let cols=20
	else
		echo "Columnas asignadas correctamente"
	fi
		#columns output//lo guardamos en el fichero $file
		truncate -s-1 file
		echo -n "$cols " >> $file

#PORTERIA
	read -p "Introduce la medida de la porteria: " portSize
	if [ $portSize -lt $minPort ] || [ $portSize -gt $maxPort ] ; then
		echo "El numero introducido es incorrecto, fil/2 assignat per defecto"
		let portSize=fil/2
	else
		echo "Medida de la porteria asignada correctamente"
	fi
		#output porteria// lo guardamos en el fichero $file
		truncate -s-1 file
		readFile
		echo -n "$portSize" >> $file
}
echo "BIENVENIDO/A AL PROGRAMA"
#primero de todo comprobamos que el fichero deseado existe
comprobarfichero
#si el fichero existe debemos comprobar que todos los parametros estan en regla
readFile
#en caso contrario pediremos los parametros que faltan porteclado al usuario
readFromKeyboard


while getopts 'n:f:c:p:m:0:1:' opcio; do
	case "${opcio}" in
		n) echo "Option  has been chosen" ;Nflag='true'; echo "a= ${OPTARG}";
			file="${OPTARG}"; readFromKeyboard;;
		f) echo "Option f has been chosen";Fflag='true';echo "f= ${OPTARG}";;
		c) echo "Option c has been chosen";Cflag='true'; echo "c= ${OPTARG}";;
		p) echo "Option p has been chosen";;
		m) echo "Option m has been chosen";;
		0)IFS=',';read -a strarr <<< "${OPTARG}";echo "${strarr[0]},${strarr[1]}";;
		*) error "Unexpected option ${opcio}" ;;
	esac
done
shift $(($OPTIND - 1))
printf "encara ens falta tractar els següents elements: %s\n$* \n"

