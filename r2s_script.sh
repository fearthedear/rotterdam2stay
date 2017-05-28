#!/bin/bash

while true
do
    count=0
    count=`curl -s "https://rotterdam2stay.nl/book-apartment124.html" | grep -c "filter"`

    if [ "$count" != "0" ]
    then
    	mail -s "New apartments on rot2stay" linuskinzel@gmail.com philippa.josefsson@gmail.com < mailtext.txt
    	echo "mail sent"
    	sleep 10
    	apartments_online=true
    	while [[ $apartments_online == true ]]
    		do
    		count1=0
    		count1=`curl -s "https://rotterdam2stay.nl/book-apartment124.html" | grep -c "filter"`
    		if [ "$count1" == "0" ]
    		then
    			apartments_online=false
    		else
    			sleep 10
    		fi
    	done

    else
    	echo "no new apartments. no mail send"
    	sleep 5
    fi
done
