#----------------------UF2: Gestió de la informació i de recursos en una xarxa --------------

#-------------Apuntes de BASH---------------

#Comandos basicos y scripting

_______________________________
#Introducción a Bash
---
#Hello World
---
#!/bin/bash
echo –e “Hello World”  #-e -> Se utiliza para activar caracteres especiales

echo –e "Hello World \n" #\n -> Para hacer un salto de linia

echo –e "Hello World \t" #\t -> Para hacer un tabulado

#!!! Bash es case sensitive!!!
# Bash no utiliza final de línea
# Los espacios son muy importantes en Bash
# Bash no utiliza main
# Shebang (#!/bin/bash) - Le indica a la línea de comandos con que programa interpretar el script
# (#!/bin/sh) -> Execute the file using sh, the Bourne shell, or a compatible shell
---
#Variables
---
#Declarar una variable:
passengers=0 # Sin tipo de variable (Se declara y se inicializa en la misma línea)

# Printar una variable
echo –e "$passengers"

#!/bin/bash
echo –e "Mi primera variable definida"
passengers=0
echo –e "El numero de pasajeros : $passengers"

#Los nombres de las variables deben comenzar con una letra minúscula o _ (y es de lower Camel Case)
---
Constantes
---
readonly varCar=1 #readonly -> indica que el valor no puede cambiar

readonly TOTAL_STOPS = 10 # Upper Case
_______________________________
#Operaciones aritméticas y lectura de teclado en BASH
---
#Operaciones
---
sum=$[1+2] # Suma
res=$[1-4] # Resta
mult=$[3*4] # Multiplicacion
divi=$[5/2] # División
aux=$[5%2] #=1 # Resto División

passengers=0
passengers=$[passengers+10] #first stop
passengers=$[passengers+15 – 3] #second stop

#Instalamos bc
sudo apt-get install bc

echo –e "4/3" | bc -l # bc -l -> Muestra posiciones decimales (=1.33333333333333333333)

echo –e "scale=2;4/3" | bc -l # scale=2; -> Numero de posiciones decimales

var='echo –e "scale=2;4/3" | bc –l' #'' -> ejecutamos el comando
echo $divisionDecimal #1.33 contenido de la var

#!/bin/bash
x=$[1+2] #=3
y=$[5–1] #=4
z=$[x*y] #=12
echo –e "El valor de ‘x’ e ‘y’ es $x y $y respectivamente. La multiplicación es $z"

---
#Lectura de teclado
---
read dia

#!/bin/bash
echo –e "Entra el día"
read dia
echo –e "Entra el mes"
read mes
echo –e "Entra el año"
read year
echo –e "Estamos a $dia de $mes del $year"
_______________________________
#Búsqueda de ficheros con BASH
---
# Búsqueda
---
#!/bin/bash
echo "Introduce nombre fichero a buscar: "
read fitxerbusqueda
sudo updatedb #actualizamos BBDD del locate
echo "Quieres buscar: $fitxerbusqueda"
locate $fitxerbusqueda > resultados.txt #buscamos el fichero y redireccionamos

> #Crea el fichero (si no existe) y sobrescribe
>> #Crea el fichero (si no existe) y añade nuevo contenido al final
_______________________________
#IF y CASE
---
#if
---
if [ condición ]
then
#se ejecuta sólo si la condición es cierta
fi

if [ condición1 ]; then
#will execute ONLY if condición1 is true
elif [ condición2 ]; then
#will execute ONLY if condición1 is false and condición2 is true
elif [ condiciónN ]; then
#will execute ONLY if condición1 is false, condición2 is false and condiciónN is
true
else
#will execute ONLY if all above is false
fi
--
#Comparadores numéricos
--
-gt #A > B 
-lt #A < B 
-ge #A >= B
-le #A <= B 
-eq #A = B
-ne #A != B
--
#Comparadores de texto
--
A == B #A = B 
A != B #A != B 
-z #String vacío 
-n #String no vacío

---
#Case
---
case $option in
1)
echo –e “Opción 1”
;;
2)
echo –e “Opción 2”
;;
3)
echo –e “Opción 3”
;;
*)
echo –e “Cualquier otra opcón que no es 1 o 2 o 3”
;;
esac
_______________________________
#While y Random
---
#loops
---
#!/bin/bash
#He pensado un número
numero=4
echo –e “Entra el número que creas que es:“
read usuario
if ($numero –eq $usuario); then
echo acierto
else
echo fallo
fi

---
#while
---
while [ condition ]; do # condition - boolean value
#se ejecuta mientras la condición es cierta
done 

#!/bin/bash
#He pensado un número
numero=4
while [ condition ]; do
echo –e “Entra el número que creas que es:“
read usuario
if ($numero –eq $usuario); then
echo acierto
else
echo fallo
fi
done

#!/bin/bash
#He pensado un número
numero=4
acierto=0
while [ $acierto –eq 0 ]; do
echo –e “Entra el número que creas que es:“
read usuario
if ($numero –eq $usuario); then
echo acierto
acierto=1
else
echo fallo
fi
done

---
#Random
---
#!/bin/bash
#He pensado un número
numero=$RANDOM #(0 - 32767)
acierto=0
while [ $acierto –eq 0 ]; do
echo –e “Entra el número que creas que es:“
read usuario
if ($numero –eq $usuario); then
echo acierto
acierto=1
else
echo fallo
fi
done

numero=$[RANDOM%2] # (0 - 1)
numero=$[RANDOM%101] # (0 - 100)
numero=$[numero+1] # (0 - 101)

_______________________________
#FOR y bucles con ficheros
---
#for
---
for (variable) in (elementos)
do
#Acciones
done

#!/bin/bash
for i in 1 casa 65 perro 90 gato
do
echo $i
done

#!/bin/bash
for i in 'ls'
do
echo $i
done
# imprime ficheros y carpetas de nuestra ubicación

for i in 'seq 1 10'; do
echo $i
done
# imprime en línea de 1 a 10

#!/bin/bash
#He pensado un número
numero=$[RANDOM%10]
for i in 'seq 1 5'
do
    echo –e “Entra el número que creas que es:“
    read usuario
    if ($numero –eq $usuario); then
    echo acierto
    exit
    else
    echo fallo
    fi
done

---
#for/while y ficheros
---
#for lee el fichero palabra a palabra
#!/bin/bash
for palabra in 'cat lista.txt'
do
echo $palabra
done

#while lee el fichero línea a línea
#!/bin/bash
while read linea
do
echo $linea
done < lista.txt
_______________________________
#GREP y AWK 
---
#grep
---
cat /etc/passwd | grep [elemento a buscar]

cat /etc/passwd | grep –w [elemento a buscar]

---
#awk
---
Jose Hernandez Sanz 34212312H
Luis Garcia Alonso 12212323K
Amadeu Holf Ramirez 43214321J
Carlos Andres Lopez 11122233D

cat lista | awk '{print $2}' #imprime columna 2

cat lista | awk '{print $0}' #imprime todo

cat lista | awk '{print $1 $4}' #imprime columna 1 y 4

Jose@Hernandez@Sanz@34212312H
Luis@Garcia@Alonso@12212323K
Amadeu@Holf@Ramirez@43214321J
Carlos@Andres@Lopez@11122233D

cat lista | awk –F '@''{print $1}' #imprime col1 separado por @
_______________________________