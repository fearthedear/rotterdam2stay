#!/bin/bash

while true
do
    count=0
    count=`curl -s "https://rotterdam2stay.nl/book-apartment.html" | grep -c "filter"`

    if [ "$count" != "0" ]
    then
    	mail -s "New apartments on rot2stay" linuskinzel@gmail.com alexander.holzmann.ekholm@gmail.com paul.r.tesar@gmail.com newstuffexp@gmail.com < mailtext.txt
    	echo "mail sent"
    	sleep 30
    	apartments_online=true
    	while [[ $apartments_online == true ]]
    		do
    		count1=0
    		count1=`curl -s "https://rotterdam2stay.nl/book-apartment.html" | grep -c "filter"`
    		if [ "$count1" == "0" ]
    		then
    			apartments_online=false
    		else
    			sleep 30
    		fi
    	done

    else
    	echo "no new apartments. no mail send"
    	sleep 60
    fi
done
