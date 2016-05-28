#!/bin/bash

while true
do
	count=0
    count=`curl -s "https://rotterdam2stay.nl/book-apartment.html" | grep -c "filter"`

    if [ "$count" != "0" ]
    then
    	mail -s "New apartments on rotti2stay yeah" linuskinzel@gmail.com < mailtext.txt
    	echo "mail sent"
    	sleep 86400
    else
    	echo "no new apartments. no mail send"
    	sleep 600
    fi
done