# Herramientas de hacking

## IPSCAN
### Usage 
`bash +x scripts/ipscan.sh [domain|ip]`     

Download repo and exec: `bash +x scripts/ipscan.sh myweb.com` or via **curl**: `curl -s https://github.com/brodriro/utilities/blob/master/scripts/ipscan.sh | bash`

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