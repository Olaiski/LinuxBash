#!/bin/bash


countArt() {
	count=1
	while [[ $# -gt 0 ]]; do
		echo "Arg. $count = $1"
		count=$((count+1))
		shift
	done		
}



PROGNAME=$(basename $0)

if [[ -e $1 ]]; then
	echo -e "\nFile Type:"
	file $1
	echo -e "\nFile Status:"
	stat $1

else
	echo "$PROGNAME: usage: $PROGNAME file" >&2
	exit 1
fi
