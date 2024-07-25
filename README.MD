## Utilities

### Preparar entorno de desarrollo
-  Ejecutar `bash -x ./scripts/init.sh`
- Se instalará:
    + Git
    + OhMyZsh
    + Warp terminal
    + Postman
    + Android Studio
    + Docker
    + NodeJs
    + Visual studio code
    + nmap
    + netcat

### Comandos
- grep  
`grep [word] [./directory] -n -r -i --color -I`

- nmap  
`nmap -sS -p- 192.168.x.x`

- scp   
`scp usuario@direccion_ip:/ruta/al/archivo /ruta/de/destino`    
`scp C:\Users\TuUsuario\archivo.txt usuario@192.168.1.2:/home/usuario/`

- rlwrap - reverse shell    
`rlwrap -cAr nc -nlvp 443`