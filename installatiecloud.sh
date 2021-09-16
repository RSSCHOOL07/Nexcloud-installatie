#!/bin/bash


clear
echo 'Welcome bij de installatie van NEXCLOUD'
answer='Please enter your choice: '
options=("Installeer NEXCLOUD" "annuleren")
select opt in "${options[@]}"
do
    case $opt in
        "Installeer NEXCLOUD")
            clear
            echo "Wil je nextcloud installeren (y/n)"
            read answer0
            
            if [ "$answer0" != "${answer0#[Yy]}" ] ;then
                clear
                echo "Installeren "
                sudo snap install nextcloud
                clear
                
            else
                echo "geannuleerd"
                exit
                
            fi
            
        echo "druk op enter om een admin account aantemaken"
        read answer
            
                clear
                echo 'admin account aanmaken'
                sudo nextcloud.manual-install admin admin
                echo 'nextcloud admin account is aan gemaakt gebruikersnaam: admin wachtwoord: admin'
                
                
        
        echo "druk op enter om de vertrouwde domein aan te passen"
        read answer
            
                clear
                echo 'domein aanpassen'
                sudo nextcloud.occ config:system:get trusted_domains
                sudo nextcloud.occ config:system:set trusted_domains 1 --value=192.168.78.131
                sudo nextcloud.occ config:system:get trusted_domains
                echo 'domein aangepast'

           
            
            
            echo 'druk op enter voor Beveiliging van de Nextcloud-webinterface met SSL'
            read answer
            
                clear
                sudo ufw allow 80,443/tcp
                sudo nextcloud.enable-https lets-encrypt
                sudo nextcloud.enable-https self-signed
         
        
        echo 'Het is gelukt je hebt Nexcloud geïnstalleerd
        open de webbroser en ga naar https://test.com nu kom je op de site log in met de volgende gegevends wachtwoord en gebruikers naam zijn Admin'

            
            ;;
                
        "annuleren")
        
                echo "geannuleerd"
                exit
            
            ;;
            
        *) echo "niet het juiste anwoord error options: kies de optie die staan weer gegeven in het menu $REPLY";;
    esac
    
done