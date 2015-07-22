#! /bin/bash

######## -Description : This file is to provide the weather info for the
######## date of day by call Yahoo weather API. 
######## - Filename : weather.sh
######## - Author: Hani Hammadeh
######## - Version: 1.0
######## the woeid here is '1940345' for the city of Dubai

curl -s -o 'out.log' https://query.yahooapis.com/v1/public/yql \
   -d q="select  item.condition from weather.forecast where woeid=1940345" \
   -d format=xml
sleep 1
cat out.log |grep temp|cut -d">" -f5|awk -F'"' '{print $6, $8 ,$10}'