#! /bin/bash
texto="carlos 123 431 prova"
nwords=5
x=1
file='/home/milax/FSOPrac1/params.txt'
function prueba1
{
    while [ $x -lt $nwords ] 
    do
        y=`echo $texto | cut -d' ' -f$x`
        echo "Hola: $y"
        echo $texto | cut -d' ' -f$x
        let x=x+1
        echo -n "$texto " > $file
        #echo "$1, $2"
    done
}

function prueba2
{
    num=0
    while read line; do
    echo "Line= $line"
    z=`echo $line | cut -d' ' -f$x`
    
    echo "Separated: $z"
    let x=x+1
        if [ $num -eq 2 ] 
        then
            posFilaPil=`echo $line | cut -d' ' -f1`
            echo $posFilaPil
            posColPil=`echo $line | cut -d' ' -f2`
            echo $posColPil
            velFil=`echo $line | cut -d' ' -f3`
            echo $velFil
            velCol=`echo $line | cut -d' ' -f4`
            echo $velCol
        fi
    let num=num+1
    done < $file
}
prueba2
#echo $var | cut -d' ' -f1