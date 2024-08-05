# Herramientas de hacking

## IPSCAN
### Usage 
`bash +x scripts/ipscan.sh [domain|ip]`     

Download repo and exec: `bash +x scripts/ipscan.sh myweb.com` or via **curl**: `curl -s https://raw.githubusercontent.com/brodriro/utilities/master/scripts/ipscan.sh | bash -s -- myweb.com`

See script [ipscan.sh](/scripts/ipscan.sh)

After exec, check **ipscan_result.txt** file


## Other commands
- Info de IP/dominio    
`https://centralops.net/`   
`https://dnsdumpster.com/`

- tcpdump:  
    Capture TCP traffic and write to a file
    ``` 
    sudo tcpdump -i eth0 -w Desktop/capture.pcap
    ```
    Filter by IP
    ```
    sudo tcpdump host 195.200.30.56 
    ```
    All results can be viewed in capture.pcap and imported into Wireshark

- wireshark
    ```
    sudo apt install wireshark/kali-last-snapshot
    ```

### Nmap
- scan services
    ```
    sudo nmap -sV [domain] -p [port]
    ```
- export scan
    ```
    sudo nmap -v --reason -sV -ox services.xml --stylesheet="https://svn.nmap.org/nmap/docs/nmap.xsl" [domain]
    chmod 777 services.xml
    firefox services.xml
    ```