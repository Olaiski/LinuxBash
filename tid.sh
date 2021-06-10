#!/bin/bash

# Oppgave fra kurs
# Tar timer som input og regner det om til min/sek basert på
# options.
# Ex: tid.sh -s 1 (1 time = 3600 sek)
#     tid.sh -m 1 (1 time = 60 min)


SEK_I_TIME=3600
MIN_I_TIME=60

usage() {
	echo "$PROGNAME: usage: $PROGNAME [-t|-s|-m|-h] t [m [s]]"
	return
}


regnsek() {
	local time=$1
	time=$(($time*$SEK_I_TIME))

	if [[ $# -eq 3 ]]; then
		local min=$2
		local sek=$3

		
		min=$(($min*$MIN_I_TIME))


		echo "Total tid i sekunder: $(($time+$min+$sek))"
	else

		echo "Total tid i sekunder: $time"
	fi

	
	
}


regnmin() {
	local time=$1
	

	if [[ $# -eq 3 ]]; then
		
		local sek=$3
		local min=$2

		time=$(($time*$SEK_I_TIME))
		min=$(($min*$MIN_I_TIME))
		sek=$(($sek/60))


		total=$(($time+$min+$sek))
		total=$(($total/60))


		echo "Total tid i min: $total"
	else
		echo "Total tid i min: $(($time*60))"
	fi


	
}

regntimer() {
	local time=$1

	if [[ $# -eq 3 ]]; then
		local min=$2
		local sek=$3

		time=$(($time*$SEK_I_TIME))
		min=$(($min*$MIN_I_TIME))


		total=$(($time+$min+$sek))
		total=$(($total / SEK_I_TIME))

		echo "Total tid i timer: $total"

	else
		echo "Total timer $time"
	fi
	
}



# Ikke så vakker denne her, skulle ha migrert sjekkene ut.
# Mangler defualt
while [[ -n "$1" ]]; do

	case "$1" in
		-t | --timer ) 		shift
							if [[ $# -eq 3 ]]; then
								regntimer $1 $2 $3
							elif [[ $# -eq 1 ]]; then
								regntimer $1
							else
								usage
							fi
					  		;;
		-m | --minutt )		shift
							if [[ $# -eq 3 ]]; then
								regnmin $1 $2 $3
							elif [[ $# -eq 1 ]]; then
								regnmin $1
							else
								usage
							fi
							;;
		-s | --sekund )		shift
							if [[ $# -eq 3 ]]; then
								regnsek $1 $2 $3
							elif [[ $# -eq 1 ]]; then
								regnsek $1
							else
								usage
							fi	
							;;
		-h | --help)		usage
							exit
							;;

		*)					
						
							;;
	esac
	shift
done



