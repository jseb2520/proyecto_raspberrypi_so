#!/bin/bash

#Medir Ancho de banda
download_speed=$(sudo speedtest-cli | grep Download: | awk '{print $2}')
upload_speed=$(sudo speedtest-cli | grep Upload: | awk '{print $2}')

#Envio de informacion a ThingSpeak
curl --silent --request POST --header "X-THINGSPEAKAPIKEY:RPQ4VQKF03QMPTJ2" --data "field5=${download_speed}&field6=${upload_speed}" http://api.thingspeak.com/update