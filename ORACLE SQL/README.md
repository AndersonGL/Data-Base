# Oracle Database 21c XE (leve e perfeita pra estudo)   Imagem Docker

- No PowerShell ou Terminal:

- 1- docker pull gvenzl/oracle-xe:21-slim

- 2- docker run -d --name oracle-xe -p 1521:1521 -p 5500:5500 -e 
ORACLE_PASSWORD=Oracle123 -e APP_USER=appuser -e APP_USER_PASSWORD=App123
 gvenzl/oracle-xe:21-slim

- 3- docker ps -> aparece oracle-xe

- 4- docker logs oracle-xe

- Espere aparecer:

- DATABASE IS READY TO USE!
