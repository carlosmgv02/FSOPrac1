#! /bin/bash
texto="carlos 123 431 prova"
nwords=5
x=1
file='/home/milax/FSOPrac1/file'
while [ $x -lt $nwords ] 
do
    
    echo $texto | cut -d' ' -f$x
    let x=x+1
    echo -n "$texto " > $file
    //echo "$1, $2"
done
#echo $var | cut -d' ' -f1