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

### Instalar Linux en windows con WSL

- Abrir WSL como administrador
- Mostar distribuciones disponibles `wsl --list --online`
- Instalar distro `wsl --install -d kali-linux`
- Setear usuario y contraseña
- Actulizar dependencias `sudo apt update`
- Instalar interfaz gráfica `sudo apt install -y kali-win-kex`
- Lanzar la interfaz grafica `kali-win-kex`


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
