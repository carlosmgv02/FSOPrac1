#! /usr/bin/env python3
import sys
import getopt
import os
from os.path import exists
#https://www.youtube.com/watch?v=QKtc0KFYteA
#http://pymotw.com/2/getopt/
#https://www.youtube.com/watch?v=Gmr41kBp4aI
fil=0
cols=0
portSize=0
f=None
minFil=10
maxFil=120

minCol=8
maxCol=36

minPort=8

minPort=8
temp=None
posFilaPal=0
posColPal=0
midaPaleta=0
posFilaPil=0
posColPil=0
velFil=0
velCol=0
prueba1=3

def comprobarValores(fil,cols,portSize,posFilaPal,posColPal,midaPaleta,posFilaPil,posColPil,velFil,velCol):
    if ((fil > 120 ) or (fil<10)):
        fil=input("Introdueix les files de nou: " )
    if ((cols > 36) or (cols<8)):
        cols=input("Introdueix les columnes de nou: ")
    maxPort=fil-1
    if((portSize>maxPort)or(portSize<8)):
        portSize=input("Introdueix la mida de la porteria de nou: ")
    if ((posFilaPal<2) or (posFilaPal>118)):
        posFilaPal=input("Introdueixi la fila on hi ha paleta de nou: ") 
    if ((posColPal<2) or (posColPal>35)):
        posColPal=input("Introdueixi la columna on hi ha paleta de nou: ")
    if ((midaPaleta<2) or (midaPaleta>118)):
        midaPaleta=input("Introdueixi la mida de la paleta de nou: ")
    if ((posFilaPil<2) or (posFilaPil>118)):
        posFilaPil=input("Introdueixi les files on hi ha pilota de nou: ")
    if ((posColPil<2) or (posColPil>35)):
        posColPil=input("Introdueixi es columnes on hi ha pilota de nou: ")
    if ((velFil<-1.0) or (velFil>1.0)):
        velFil=input("Introdueixi la velocitat x de la pilota de nou: ")
    if ((velCol<2) or (velCol>118)):
        velCol=input("Introdueixi la velocitat y de la pilota de nou: ")
    
def readFile(archivo):
    print("READ FILE")

def writeFile(archivo):
    print("WRITE FILE")
    
def introducirRestantes():
    print("INTRODUCIR RESTANTES")

def printVariables(fil,cols,portSize,posFilaPal,posColPal,midaPaleta,posFilaPil,posColPil,velFil,velCol):
    print("")
    print("PRINT VARIABLES")
    print("files:" + str(fil))
    print("columnes:" + str(cols))
    print("portSize:" + str(portSize))
    print("posFilaPal:" + str(posFilaPal))
    print("posColPal:" + str(posColPal))
    print("midaPaleta:" + str(midaPaleta))
    print("posFilaPil:" + str(posFilaPil))
    print("posColPil:" + str(posColPil))
    print("velFil:" + str(velFil))
    print("velCol:" + str(velCol))
    
def comprobarFichero(archivo):
    f=None
    print("COMPROBANDO FICHERO...")
   
    try:
        f = open(archivo)
        print("Hem pogut accedir al fitxer.")
    except IOError:
        print("No s'ha pogut obrir el fitxer.")
    finally:
        f.close()

def readFromKeyboard(temp):
    print("READ FROM KEYBOARD")
    temp=temp+1
    print("temp vale "+(str(temp)))


def main():
    
    archivo=None

    args=sys.argv[1:]
    try:
        opts, args=getopt.getopt(args,"n:f:c:",["arxiu=","files=","columnes="])
    except getopt.GetoptError as error_message:
        print(error_message)
        #return False

    for opt,arg in opts:
        if opt in ['-n','--arxiu']:
            archivo=arg
            print(archivo)
        elif opt in ['-f','--files']:
            try:
                fil=int(arg)
                print(fil)
            except:
                fil=int(input("Introdueix les files de nou: "))
        elif opt in ['-c','columnes']:
            print("prueba")
    comprobarFichero(archivo)
    comprobarValores(150,20,10,20,20,10,20,20,0.5,0.5)
    
if __name__ == "__main__":
    #main()
    readFromKeyboard(prueba1)
    print(prueba1)