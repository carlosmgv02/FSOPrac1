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

posFilaPil=0
posColPil=0
velFil=0
velCol=0


Nflag=''
Fflag=''
Cflag=''
Pflag=''
OFlag=''
OneFlag=''
MFlag=''

found='false'
extraPilotes='false'
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
function printVariables
{
	echo ""
	echo "VALORES DE LAS VARIABLES:"
	echo "fils: $fil"
	echo "cols: $cols"
	echo "portSize: $portSize"
	echo "posFilaPal: $posFilaPal"
	echo "posColPal: $posColPal"
	echo "midaPaleta: $midaPaleta"
	echo "posFilaPil: $posFilaPil"
	echo "posColPil: $posColPil"
	echo "velFil: $velFil"
	echo "velCol: $velCol"
}
function comprobarValores
{
	if [ $fil -lt $minFil ] || [ $fil -gt $maxFil ] ; then
		read -p "Files incorrectes, torna a provar: " fil
	fi

	if [ $cols -lt $minCol ] || [ $cols -gt $maxCol ] ; then
		read -p "Columnes incorrectes, torna a provar: " cols
	fi
	if [ $portSize -lt $minPort ] || [ $portSize -gt $maxPort ] ; then
		read -p "Porteria incorrecta, torna a provar: " portSize
	fi
	if [ $posFilaPal -lt 2 ] || [ $posFilaPal -gt 118 ] ; then
		read -p "posFilaPal incorrecta, torna a provar: " posFilaPal
	fi
	if [ $posColPal -lt 2 ] || [ $posColPal -gt 35 ] ; then
		read -p "posColPal incorrecta, torna a provar: " posColPal
	fi
	if [ $midaPaleta -lt 3 ] || [ $midaPaleta -gt $maxPort ] ; then
		read -p "Mida paleta incorrecta, torna a provar: " midaPaleta
	fi
	if [ $posFilaPil -lt 2 ] || [ $posFilaPil -gt 118 ] ; then
		read -p "posFilaPil incorrecta, torna a provar: " posFilaPil
	fi
	if [ $posColPil -lt 2 ] || [ $posColPil -gt 35 ] ; then
		read -p "posColPil incorrecta, torna a provar: " posColPil
	fi
	if [ $velFil -lt -1 ] ; then
		echo "Prueba"
	fi


}
function comprobarfichero
{
	carlos='carlos'
	file='/home/milax/FSOPrac1/params.txt'
	if [ -f $file ] && [ -e $file ]
	then
		
		num=0
		while read line; do
		if [ $num -eq 0 ]
		then
			fil=`echo $line | cut -d' ' -f1`
			cols=`echo $line | cut -d' ' -f2`
			portSize=`echo $line | cut -d' ' -f3`
		elif [ $num -eq 1 ]
		then
			posFilaPal=`echo $line | cut -d' ' -f1`
			posColPal=`echo $line | cut -d' ' -f2`
			midaPaleta=`echo $line | cut -d' ' -f3`

		elif [ $num -eq 2 ] 
        then
            posFilaPil=`echo $line | cut -d' ' -f1`
            echo "$posFilaPil"
            posColPil=`echo $line | cut -d' ' -f2`
            echo "$posColPil"
            velFil=`echo $line | cut -d' ' -f3`
            echo "$velFil"
            velCol=`echo $line | cut -d' ' -f4`
            echo "$velCol"
        

		elif [ $num -eq 3 ] && [ ! -z "$line" ]
		then
			extraPilotes='true'
			posFilaPil=`echo $line | cut -d' ' -f1`
            echo "$posFilaPil"
			
            posColPil=`echo $line | cut -d' ' -f2`
            echo "$posColPil"
            velFil=`echo $line | cut -d' ' -f3`
            echo "$velFil"
            velCol=`echo $line | cut -d' ' -f4`
            echo "$velCol"
		fi
    	let num=num+1

		
		found='true'
		done < $file
		let maxPort=$fil-1
		
	else
		echo "No existe el archivo $file, procedemos a crearlo"
		touch $file	#si no existe el fichero lo creamos
	fi
}

function readFromKeyboard
{
	if [ -z $Nflag ] ; then

		read -p "Introduce el nombre del archivo que quieres usar: " file
	fi
	
#FILAS
	if [ -z $Fflag ] ; then
		read -p "Introduce el numero de filas: " fil
	fi
		let maxPort=fil-1
		#rows output
		truncate -s-1 file
		#echo -n "$fil " > $file
#COLUMNAS
	if [ -z $Cflag ] ; then
		read -p "Introduce el numero de columnas: " cols
	fi
		#columns output//lo guardamos en el fichero $file
		truncate -s-1 file
		#echo -n "$cols " >> $file

#PORTERIA
	if [ -z $Pflag ] ; then
		read -p "Introduce la medida de la porteria: " portSize
	fi
		#output porteria// lo guardamos en el fichero $file
		truncate -s-1 file
		
		#echo -n "$portSize" >> $file
		comprobarValores
}
	#comprobarfichero

	#comprobarValores
echo "BIENVENIDO/A AL PROGRAMA"
#primero de todo comprobamos que el fichero deseado existe
#si el fichero existe debemos comprobar que todos los parametros estan en regla
	#readFile
#en caso contrario pediremos los parametros que faltan porteclado al usuario
	#readFromKeyboard


while getopts 'n:f:c:p:m:0:1:' opcio; do
	case "${opcio}" in
		n) echo "Option  has been chosen" ;Nflag='true'; echo "a= ${OPTARG}";
			file="${OPTARG}";;
		f) echo "Option f has been chosen";Fflag='true';fil=${OPTARG};echo "f= ${OPTARG}";;
		c) echo "Option c has been chosen";Cflag='true';cols=${OPTARG}; echo "c= ${OPTARG}";;
		p) echo "Option p has been chosen";portSize=${OPTARG};Pflag='true';;
		m) echo "Option m has been chosen";midaPaleta=${OPTARG};MFlag='true';;
		0)IFS=',';read -a strarr <<< "${OPTARG}";posFilaPal=${strarr[0]};posColPal=${strarr[1]};OFlag='true';;
		1) echo "1- ${OPTARG}";IFS=',';read -a split <<< "${OPTARG}";posFilaPil=${split[0]};
			posColPil=${split[1]};velFil=${split[2]};velCol=${split[3]};OneFlag='true';;
		#*) error "Unexpected option ${opcio}" ;;
	esac
done
shift $(($OPTIND - 1))
printf "encara ens falta tractar els següents elements: %s\n$* \n"
readFromKeyboard
printVariables