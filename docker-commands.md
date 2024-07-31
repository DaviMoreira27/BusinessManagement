- **docker exec -it container-name sh** - Permite executar comandos dentro do container, como por exemplo, php artisan make:controller TestController
- **docker ps** - Mostra os containers rodando atualmente, dependo da flag, também mostra os parados (com a flag **-a**)
- **docker-compose up --build** - Builda um ou mais containers de acordo com o conteúdo do compose.yaml e os inicia
- **docker-compose up** - Inicia os containers já buildados
- **docker build .** - Builda um container de acordo com o Dockerfile, builda apenas o um container diferentemente do docker-compose