#!/bin/bash

#Escáner de red para localizar y loguear puertos abiertos
#by_telémaco

#Config

puerto=8291

check_port () {
estado_ip=$(nmap -p $puerto $ip | grep $puerto | awk '{print $2}')


if [ "$estado_ip" = "open" ]; then
	echo "$ip Puerto $puerto OPEN" >> log.txt
	echo "$ip Puerto $puerto OPEN"
elif [ "$estado_ip" = "closed" ]; then
	echo "$ip Puerto $puerto CLOSED"
elif [ "$estado_ip" = "filtered" ]; then
	echo "$ip Puerto $puerto FILTRADO"
else
	echo "$ip Algo a fallado con la salida de nmap"
fi
}

for (( one=1; one<=255; one++ ))
do
	for (( two=0; two<=255; two++ ))
    do
		for (( three=0; three<=255; three++ ))
		do
			for (( four=1; four<=254; four++ ))
			do

		   	ip="$one.$two.$three.$four"
			check_port

			done
		done
	done
done
