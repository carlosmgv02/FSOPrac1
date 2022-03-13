#! /usr/bin/env python3
import sys
import getopt
from os.path import exists
fil=0
cols=0
portSize=0

minFil=10
maxFil=120

minCol=8
maxCol=36

minPort=8

minPort=8
temp=fil
posFilaPal=0
posColPal=0

posFilaPil=0
posColPil=0
velFil=0
velCol=0

#https://www.youtube.com/watch?v=QKtc0KFYteA
#http://pymotw.com/2/getopt/
#https://www.youtube.com/watch?v=Gmr41kBp4aI

def prueba_getopt(arg_list):
    global archivo
    global filas

    args=sys.argv[1:]
    try:
        opts, args=getopt.getopt(args,"n:f:",["arxiu=","files="])
    except getopt.GetoptError as error_message:
        print(error_message)
        return False
    print(opts,args)
    print(opts)

    for opt,arg in opts:
        if opt in ['-n','--arxiu']:
            print("Hola")
            temp_fn=arg
            print(temp_fn)
        elif opt in ['-f','--files']:
            try:
                fil=int(arg)
                print(fil)
            except:
                fil=int(input("Introdueix les files de nou"))

    if exists(temp_fn) == True:
        archivo=temp_fn
        filas=fil
        return True
    return False

def readFile():
    print("READ FILE")
def writeFile():
    print("WRITE FILE")
def introducirRestantes():
    print("INTRODUCIR RESTANTES")
def printVariables():
    print("PRINT VARIABLES")
def comprobarValores():
    print("COMPROBAR VALORES")
def comprobarFichero():
    print("COMPROBAR FICHERO")
def readFromKeyboard():
    print("READ FROM KEYBOARD")

if __name__ == "__main__":
    print("BIENVENIDO AL PROGRAMA: ")
    archivo=None
    filas=None
    args=sys.argv[1:]
    rv = prueba_getopt(args)
    print(archivo)
    if rv==False:
        exit()
