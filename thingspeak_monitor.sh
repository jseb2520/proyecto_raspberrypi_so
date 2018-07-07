#!/bin/bash

#Uso CPU
cpu_usage=$(mpstat 4 1 | awk '$3 ~ /CPU/ { for(i=1;i<=NF;i++) { if ($i ~ /%idle/) field=i } } $3 ~ /all/ { print 100 - $field }')

#Uso RAM
mem_usage=$(free -m | awk 'NR==2{printf "%.2f\n",$3*100/$2 }')

#Carga de CPU
cpu_load=$(uptime | awk '{print $9}')

#Almacenamiento disponible
storage_avail=$(df -h | grep /dev/root | awk '{print $4}')

#Sensor de humedad de Suelo
moisture=$(/home/pi/IoT/SoilSensor)

#Envio de informacion a ThingSpeak
curl --silent --request POST --header "X-THINGSPEAKAPIKEY:RPQ4VQKF03QMPTJ2" --data "field1=${cpu_usage}&field2=${cpu_load}&field3=${mem_usage}&field4=${storage_avail}&field7=${moisture}" http://api.thingspeak.com/update
