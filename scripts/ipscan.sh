#!/bin/bash

domain=$1
writeToFile="tee -a ipscan_result.txt"


echo "Search info IP for $domain" | $writeToFile
whois $domain | $writeToFile
echo "=========================================" | $writeToFile
echo " " | $writeToFile

echo "Scan ports for $domain" | $writeToFile
#nmap -sS -p- $domain | $writeToFile
echo "=========================================" | $writeToFile
echo " " | $writeToFile

echo "Search subdomains and public data for $domain ..." | $writeToFile
if ! command -v theHarvester &> /dev/null | $writeToFile
then
    echo "theHarverter could not be found, pleaase install it or use Kali-Linux" | $writeToFile
else
    theHarverter -d $domain -b baidu,dnsdumpster,subdomaincenter,yahoo,urlscan,sitedossier,rapiddns,duckduckgo,github-code -l 100 | $writeToFile
fi 
echo "=========================================" | $writeToFile
echo " " | $writeToFile
echo "::::::::::Thanks for use script::::::::::" | $writeToFile
echo "Check ./ipscan_result.txt file for results" | $writeToFile
