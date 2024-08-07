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

- find  
`find /home/Desktop -iname [word]`

- nmap  
`nmap -sS -p- 192.168.x.x`

- scp   
`scp usuario@direccion_ip:/ruta/al/archivo /ruta/de/destino`    
`scp C:\Users\TuUsuario\archivo.txt usuario@192.168.1.2:/home/usuario/`

- rlwrap - reverse shell    
`rlwrap -cAr nc -nlvp 443`

- Test de rendimiento web   
`npm install -g artillery`
    
    crear archivo `test.yml`

    ```
    config:
      target: "https://example.com"
      phases:
        - duration: 60
          arrivalRate: 10

    scenarios:
      - flow:
        - get:
            url: "/"
    ```

    Ejecutar `artillery run test.yml`

- Instalar paquetes `.deb`  
`sudo dpkg -i [path-file.deb]`

- Info de IP o server web   
`whois www.google.com` `whois 192.168.200.25`

### Instalar Linux en windows con WSL

- Abrir WSL como administrador
- Mostar distribuciones disponibles `wsl --list --online`
- Instalar distro `wsl --install -d kali-linux`
- Setear usuario y contraseña
- Actulizar dependencias `sudo apt update`
- Instalar interfaz gráfica `sudo apt install -y kali-win-kex`
- Lanzar la interfaz grafica `kali-win-kex`

#### Habilitar Ip compartida
- Crear archivo `.wslconfig` en la carpeta usuario con `cmd + R` y escribir `%UserProfle%` 
``` 
[wsl2]
networkingMode=mirrored   
```
- Apagar y encender linux
```
wsl -l -v
wsl -t kali-linux
wsl -d kali-linux
```


### Habilitar permisos de usuario
- Tabla de permisos
```
1   2   3   4   5   6   7
x   w   wx  r   rx  rw  rwx
```

```
r: read
w: write
x: execute
```
```
chmod [user]|[group]|[all] index.html
```
- Ejecución `chmod 667 index.html`


### Metadatos de imagenes
- Instalar `exiftool`   
  `sudo apt install libimage-exiftool-perl -y`

- Ejecutar `exiftool image.jpg`

### Obtener informacion publica de webs o IP
- Instalar: `sudo apt install theharvester/kali-last-snapshot`
- Usar: `theHarvester -d myweb.com -b [soruce1,source2] -l 100`


### Instalar recon-ng
`sudo apt install recon-ng/kali-last-snapshot -y`

- Instalar path `marketplace install recon/domains-contacts/whois_pocs`
- Cargar módulo `modules load recon/domains-contacts/whois_pocs`

- Setear source `options set SOURCE web.com`
- Ejecutar comando `run`