# Herramientas de hacking

- Info de IP/dominio    
`https://centralops.net/`   
`https://dnsdumpster.com/`

- tcpdump:  
    Capturar trafico tcp y escribirlo en un archivo
    ``` 
    sudo tcpdump -i eth0 -w Desktop/capture.pcap
    ```
    Filtrar por ip
    ```
    sudo tcpdump host 195.200.30.56 
    ```
    Todo reporte se puede exportar y visualizar en wireshark

- wireshark
    ```
    sudo apt install wireshark/kali-last-snapshot
    ```