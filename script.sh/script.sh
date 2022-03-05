#-------------------------------------BASH. Exercicis de scripts-----------------------------------------------
---
#1. Fes un script que ens indiqui si la tecla que hem polsat és una lletra, un número o un altre caràcter.
# • Fes-ho amb la comanda “case”
# • Ex: un rang de valors del 0 al 9 es pot avaluar amb [0-9]
---
#!/bin/bash
echo -n "Pulsa una tecla: "
read tecla
case $tecla in
[0-9])
echo "es un numero";;
[a-zA-Z])
echo "es una lletra";;
*)
echo "es un caracter especial"
esac
---
#2. Fes un script que quan l’executem ens digui quin dia de la setmana es (dilluns, dimarts,
#dimecres, dijous, divendres, dissabte o diumenge).
#• Utilitza la comanda “date” per saber el dia de la setmana.
---
#!/bin/bash
dia=$(date +%a)
case $dia in
lun)
echo "dilluns";;
mar)
echo "dimarts";;
mié)
echo "dimecres";;
jue)
echo "dijous";;
vie)
echo "divendres";;
sab)
echo "dissabte";;
dom)
echo "diumenge";;
*)
echo "revisa el script";;
esac
---
# 3. Fes un script que ens doni la hora escrita segons el següent format: “dotze hores i vint-i-tres minuts”.
# • Utilitza la comanda “date” per saber l’hora. Les xifres en text han d’estar en un fitxer de text,
# i el script ha de filtrar amb “awk” en funció de l’hora i dels minuts.
#• El fitxer “numeros.txt” ha de tenir la forma
#0:zero
#1:u
#2:dos
#...
---
#!/bin/bash
hora=$(date +%H)
minut=$(date +%M)
hora_num=$(sed -n "$hora"p numeros.txt)
minut_num=$(sed -n "$minut"p numeros.txt)
echo "$hora_num hores i $minut_num minuts"

#!/bin/bash
echo "Script que calcula el factorial d'un numero"
echo -n "Introdueix un numero. "
---
# 4. Fes un script que ens calculi el factorial d’un nombre
# • Ex: 5! = 5 · 4 · 3 · 2 · 1
---
#!/bin/bash
echo "Script que calcula el factorial d'un numero"
echo -n "Introdueix un numero. "
read numero
factorial=1
for valor in $(seq 1 $numero)
do
factorial=$(($factorial*$valor))
done
echo $factorial
---
# 5. Fes un script que ens digui si un nombre és primer
# • Un nombre és primer si només es divisible per 1 i per si mateix. Per tal d’agilitzar el script,
# pots avaluar la resta de la divisió des de “2” fins a “num-1”.
# • En cas que sigui divisible per algun d’aquests valors, ja no és un nombre primer i pots sortir
# del bucle.
---
#!/bin/bash
echo -n "Introdueix un numero: "
read numero
primer=1
for valor in $(seq 2 $(($numero-1)))
do
if [ $(($numero%$valor)) -eq 0 ]
then
primer=0
break
fi
done
if [ $primer -eq 1 ]
then
echo "$numero es primer"
else
echo "$numero no es primer"
fi
---
#6. Fes un script que ens mostri els 1000 primers nombres primers.
#• Per fer aquest script aprofita l’anterior, i dissenya una funció que ens digui si un nombre és o
#no primer.
#• El professor ha d’explicar com fer una funció en BASH SCRIPT
---
#!/bin/bash
es_primer()
{
numero=$1
primer=1
for valor in $(seq 2 $(($numero-1)))
do
if [ $(($numero%$valor)) -eq 0 ]
then
primer=0
break
fi
done
return $primer
}
echo "Script que troba els numeros primers que hi ha entre 1 i el numero entrat"
echo -n "numero: "
read numero
for i in $(seq 1 $numero)
do
es_primer $i
if [ $? -eq 1 ]
then
echo -n "$i, "
fi
done
---
# 7. Fes un script que ens mostri per pantalla quin és el "UID” de cadascun dels usuaris (només dels
# usuaris que no son de sistema) de la màquina (“login” “UID”)
#• Per fer aquest script has de filtrar el contingut del fitxer /etc/passwd
---
#!/bin/bash
awk -F: '$3 >= 1000 {print "login:" $1, "uid:" $3}' /etc/passwd
---
# 8. Fes un script que ens faci un llistat de tots els subdirectoris que hi ha en un determinat directori
# entrat per línia de comandes. Si el directori no existeix, surt del script amb un missatge d’error
# • Per saber si el paràmetre és un directori, podem fer servir la condició [ -d directori ] que serà
# certa si directori és un directori
---
#!/bin/bash
if [ -d $1 ]
then
for valor in $(ls $1)
do
if [ -d $1/$valor ]
then
echo "$1/$valor"
fi
done
else
echo "$1 no es un directori"
fi
---
#9. Fes un script que ens busqui un fitxer dins d’un directori . En cas que existeixi ens digui el
# propietari del mateix. El script ens demanarà un nou directori, en cas que el que fiquem no
#existeixi
---
#!/bin/bash
echo -n "Fica el directori: "
read directori
echo -n "Fica el nom del fitxer: "
read fitxer
if [ -f $directori/$fitxer ]
then
 prop=$(ls -l $directori/$fitxer | awk '{print $3}')
 echo "El fichero $fitxer esta en el directori $directori i el propietario es $prop"
fi
---
# 10. Executa tres pings a diferents ips, en background i redirigint la seva sortida a /dev/null. Fes un
# script que ens mostri una llista amb el PID associat a cada ping (“numero” “PID” “pagina a la que
# fa ping”), i posteriorment et pregunti de quin numero de la llista vols aturar el ping.
# • Per fer el “ping” amb la sortida redirigida i en backgroud, utilitzarem la comanda:
# ping ip > /dev/null &
# • Per aturar un procès a través del seu PID (ex: PID = 4432), utilitzem la comanda:
# kill –9 4432
---
#!/bin/bash
numero=1
for i in $(pidof ping)
do
array_ping[$numero]=$i
echo -n "$numero: "
ps -ef | awk ' $2=="'$i'" {print $8, $9}'
numero=$(($numero+1))
done
echo -n "Quin ping vols aturar: "
read linia
kill -9 ${array_ping[$linia]}
---
_______________________________
#date (instruccion)
date | awk '{print $3}'

#Pasar una lista desde comando 
for i in $*
do
    echo $i #= "$i"
done

./script.sh pepe alex 12 33

#ejercicio 8
if [ -d $1 ]
then
    for i in $(ls $1)
    do
        if [ -d $1/$temp]
        then 
            echo $1/$temp
        fi
    echo "$1 existeix"
else
    echo "$1 no existeix"
fi

#ejercicio 9
echo "Fica el directori"
read directori

echo "Fica es el fitxer"
read fitxer

if [ -f $directorio/$fitxer]
then 
    propietario=$(ls -l $directori/$fitxer | awk '{print $3}')
    echo "El fichero $fitxer esta en el directorio $directori i el propietario es $propietario"
fi

#ejercicio 10 identificador del proceso 
ping google.es >/dev/null & - RESPUESTA:[1] 
1345

ps -ef |grep ping

ps -ef |awk '$8=="ping" {print $2}'

man ps 

#!/bin/2bash
numero=1
pidPing = $(ps -ef | awk '$8=="ping" {print $2}')

for i in $pidPing
do
    #array
    echo "$numero : $i"
    #numero=$(($numero + 1))
    numero=$((numer++))
done


#!/bin/bash
#################################################1a opcion
#netstat -rn | awk '{print $1}' > aux.txt
#nlinies=`wc -l < aux.txt`
#resta=$[nlinies-2]
#tail -n $resta aux.txt
#echo "Tens $resta linies a la taula"

#################################################2a opcion

#netstat -rn > rutes.txt
#cat rutes.txt | awk '$1 !~ /^D/ && $1 !~ /^T/ {print $1}'

#################################################3a opcion

#netstat -rn > rutes.txt
#cat rutes.txt | awk '/0/ {print $1}'

#################################################4a opcion

#netstat -rn > rutes.txt
#cat rutes.txt | awk '$1 !~ /e/ {print $1}'

#################################################5a opcion

#netstat -rn > rutes.txt
#cat rutes.txt | awk 'NR > 2 {print $1}'

#################################################6a opcion

#netstat -rn > rutes.txt
#cat rutes.txt | awk '$1 ~ /[.]/ {print $1}'

#################################################7a opcion

netstat -rn > rutes.txt
cat rutes.txt | awk '$1 ~ /[0-9]/ {print $1}'

-----

#!/bin/bash

#Ejemplo 15 tabla de multiplicar

echo "De que numero quieres la tabla ???"
read number
echo "De que longitud quieres la tabla ???"
read long
#Quiero multiplicar el numero entrado de 0 hasta 10
count=0
while [ $count -le $long ]
do
	multipli=$[number*count]
	echo "$number * $count = $multipli"
	count=$[count+1]
done

# Ejemplo 15

-----

#!/bin/bash
echo $RANDOM

echo "Introdueix pedra, paper o tissores:"
read resposta

rand=$[$RANDOM % 3]
echo $rand

if [ $rand -eq 0 ]; then
	pcresposta="pedra"
	echo "L'ordinador ha escollit pedra"
elif [ $rand -eq 1 ]; then
	pcresposta="paper"
	echo "L'ordinador ha escollit paper"
elif [ $rand -eq 2 ]; then
	pcresposta="tissores"
	echo "L'ordinador ha escollit tissores"
fi

function proces () {

if [ $resposta == $pcresposta ]; then
	echo "Empat"

	elif [ $resposta == "paper" ]; then
		if [ $pcresposta == "pedra" ]; then
			echo "Guanya l'usuari (paper)"
		else
			echo "Guanya l'ordinador (tissores)"
		fi
	elif [ $resposta == "pedra" ]; then
		if [ $pcresposta == "paper" ]; then
			echo "Guanya l'ordinador (paper)"
		else
			echo "Guanya l'usuari (tissores)"
		fi
	elif [ $resposta == "tissores" ]; then
		if [ $pcresposta == "paper" ]; then 
			echo "Guanya l'usuari (tissores)"

		else
			echo "Guanya l'ordinador (pedra)"
		fi
fi
}
proces

-------

#!/bin/bash

echo "Cómo quieres la leche?"
echo "Fria, Natural o Caliente"
read input

	if [ $input = "Fria" ];then
		echo "Ya está"
	elif [ $input = "Natural" ];then
		echo "Calentando..."
		sleep 1
	elif [ $input = "Caliente" ];then
		echo "Calentando muy fuerte"
		echo "Calentando más"
		echo "Calentando"
		bucle=0
		while [ $bucle -le 8 ]
		do
			echo "Calentando aún más"
			sleep 1
			bucle=$[bucle+1]
		done
	else
		echo "Introduce un valor correcto"
	fi

#------------------------------------------------------------------------------------------
#25/02/2022

#Mostrar los usuaris con procesos que ejucutan 
#!/bin/bash

usuarisAmbProcessos=$(ps -ef --no-headerd | awk '{print $1}' |sort |uniq)

for usuari in $usuarisAmbProcessos
do
	processosUsuari=$(ps -ef | awk '$1=="'$usuari'" {print $2}')
	echo "Els processos de $usuari son :"
	echo $processosUsuari
done

cat /etc/passwd |more
entrar:
sh marc@localhost

ejecutar:


#!/bin/bash

usuarisAmbProcessos=$(ps -ef --no-headerd | awk '{print $1}' |sort |uniq)

for usuari in $usuarisAmbProcessos
do
	processosUsuari=$(ps -ef | awk '$1=="'$usuari'" {print $2}')
	echo "Els processos de $usuari son :"
	echo $processosUsuari
done

////////////
horaEntrada=$(echo $1 | awk -F : '{print $1}')
minutEntrada=$(echo $1 | awk -F : '{print $2}')

horaSalida=$(echo $2 | awk -F : '{print $1}')
minutSalida=$(echo $2 | awk -F : '{print $2}')

minutsEntrada=$(($horaEntrada * 60 +$minutEntrada))
minutsSalida=$(($horaSalida * 60 +$minutSalida))

minutsTotals=$(($minutsSalida - $minutsEntrada))

hores=$(($minutsTotals / 60))
minuts=$((minutsTotals % 60))

echo "avui has treballat $hores hores i $minuts minuts"

#cuando no se ejecuta
chmod 777 fitxer.sh
./fitxer.sh


///
while read linia
do
	echo $lines >> nouFitxer.txt
done //

#4. 
#!/bin/bash
echo -n "Factorial de: "
read factorial
res=1
echo "Calcular el factorial de $factorial!"
while [ $factorial -gt 1 ]
    do
    let res=$res*$factorial
    let factorial-=1
    echo "$res"
done

#5. Fes un script que ens digui si un nombre és primer
#• Un nombre és primer si només es divisible per 1 i per si mateix. Per tal d’agilitzar el script,
#pots avaluar la resta de la divisió des de “2” fins a “num-1”.
#• En cas que sigui divisible per algun d’aquests valors, ja no és un nombre primer i pots sortir
#del bucle.

echo -n "Fica un numero"
read numero

primer=1

for valor in $(seq 2 $(($numero-1)))
do
    if [$(($ % $valor)) -eq 0]
    then
        primer=0
        break
    fi
done

if [ $primer -eq 1 ]
then
    echo "$numero es un numero primer"
else
    echo "$numero NO es un numero primer"
fi

#6. Fes un script que ens mostri els 1000 primers nombres primers.
#• Per fer aquest script aprofita l’anterior, i dissenya una funció que ens digui si un nombre és o
#no primer.
#• El professor ha d’explicar com fer una funció en BASH SCRIPT

es_primer() {
primer=1
numero=$1

for valor in $(seq 2 $(($numero-1)))
do
    if [$(($ % $valor)) -eq 0]
    then
        primer=0
        break
    fi
done
}

for i in $(seq 1 $1)
do 
    es_primer $1
    if [$? -eq 1]
    then
        echo -n "$i,"
    fi
done

#7. Fes un script que ens mostri per pantalla quin és el "UID” de cadascun dels usuaris (només dels
# usuaris que no son de sistema) de la màquina (“login” “UID”)
#• Per fer aquest script has de filtrar el contingut del fitxer /etc/passwd
awk -F :'$3>=1000 {print $1}' /etc/passwd

awk -F :'$3>=1000 && $3<10000' {print "login:"$1, "uid:"$3}''

/home (usuario)

#8. Fes un script que ens faci un llistat de tots els subdirectoris que hi ha en un determinat directori
#entrat per línia de comandes. Si el directori no existeix, surt del script amb un missatge d’error
# • Per saber si el paràmetre és un directori, podem fer servir la condició [ -d directori ] que serà
# certa si directori és un directori

if [ -d $1]
then 
    for temp in $(ls $1)
    do
        if [-d $1/$temp ]
        then
            echo "$1/$temp"
        fi
    done
else
    echo "$1 no es un directori"
fi

#----------04/03-----------

ls -l |awk '{print $3}' |sort |uniq
awk '{print $3}' ls.txt |sort |uniq

---
date +%m 
-> 03
date +%y
-> 22

date +%m/%y
->03/22
---

#1. SCript que ens genera un arxiu amb els mails dels usuaris que no han pagat la cuete 
-----------------------

#!/bin/bash

pagat() 
{
    mes_actual=$(date +%m)
    any_actual=$(date +%y)

    if [ $1 -eq $mes_actual ] && [ $2 -eq $any_actual ]
    then
        return 1
    else
        return 0
    fi
}

#para ver el resultado
pagat 03 22

if [ $? -eq 1]
then 
    echo "Pagat"
else
    echo "No pagat"
fi

#comprobar si existe el fichero
if [ -f impagats.txt ]
then 
    rm impagats.txt
fi

#leer linia linia
while read linia
do 
    ultim_mes_pagat=$(echo $linia | awk '{print $3}' | awk -F / '{print $1}')
    ultim_any_pagat=$(echo $linia | awk '{print $3}' | awk -F / '{print $2}')
    usuari=$(echo $linia | awk '{print $1}')

    pagat $ultim_mes_pagat $ultim_any_pagat

    if [ $? -eq 0 ]
    then
        echo $usuari >> impagats.txt
    fi

done < netflix.txt
------------
#2. Script que ens afegeix una columna amb l'edat de l'usuari
------------
edad() 
{
    any=$(date +%Y)
    return $(($any -$1))
}
if [ -f edad.txt ]
then 
    rm edad.txt
fi
while read linia
do 
    any_nax=$(echo $linia | awk '{print $4}')

    edad $any_nax
    edat_usuari=$? #muestra el año

    echo "$linia $edat_usuari" >> edad.txt

done < netflix.txt
__________
#3. Script que ens afegeix els meses que parte l'usuari a la plataforma 
----------

__________
#Una lista de ciudades
--------
awk '{print $5}' netflix.txt |sort |uniq
awk '{print $5}' netflix.txt |sort -u
__________
#Crear ficheros con nombres de ciudades 
------
poblacions=$(awk '{print $5}' netflix.txt | sort -u)

for poblacio in $poblacions
do
    if [ -f $poblacio.txt ]
    then
        rm $poblacio.txt
    fi

    while read linia
    do
        poblacio_usuari=$(echo $linia | awk '{print $5}')
        if [ $poblacio == $poblacio_usuari ]
        then
            echo $linia >> $poblacio.txt
        fi
    done < netflix.txt
done
__________
bask -x #procedimiento del script
