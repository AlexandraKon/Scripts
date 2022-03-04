#ejercicio 7

awk -F : '$3 >= 1000 && $3 < 1000 {print "login:"$1, "uid:"$3}' /etc/passwd

#date (instruccion)

date | awk '{print $3' 

#ejemplo con for

for i in $(seq 1 1000)
do 
    echo -n "$i, "
done

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