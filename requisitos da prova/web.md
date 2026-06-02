## Prova do 2º Bimestre — Desenvolvimento Web


## Projeto: Aplicação de APIs REST


Desenvolver uma aplicação backend, sem frontend, que forneça APIs de utilidade seguindo o padrão
REST.


## Requisitos técnicos

O projeto deverá utilizar:
● Node.js 24 ou superior
● PostgreSQL 17 ou superior
● Servidor HTTP em Node.js, preferencialmente com Express. Também será permitido Fastify ou
outra biblioteca equivalente.
● ORM Node.js, preferencialmente Sequelize com driver pg. Também será permitido outro ORM,
desde que esteja documentado.


## Banco de dados e Models

O sistema deverá conter, no mínimo:
● 4 tabelas no banco de dados
● Uma tabela de usuários, com:
○ email com chave única
○ senha criptografada com bcrypt
● Uma tabela pivô
● Pelo menos uma relação N:N
● Uma Model para cada tabela
● A tabela pivô também deverá possuir Model própria



## Rotas, controladores e autenticação


O sistema deverá conter:
● Rotas REST bem definidas
● Controladores organizados
● CRUD completo para cada entidade principal
● Rota de login para gerar token JWT
● Todas as rotas protegidas por JWT, exceto a rota de login
● Pelo menos um middleware implementado pelo aluno, podendo ser de autenticação, log,
validação ou outro uso coerente
Cada entidade deverá ter, no mínimo, as 5 rotas básicas para manipulação de dados:
GET /entidades # list
GET /entidades/:id # get
POST /entidades # create
PUT /entidades/:id # update
DELETE /entidades/:id # delete
Também deverá existir a rota de login:
POST /login
Se necessário, o projeto também deverá possuir rotas para criar, consultar ou remover relacionamentos
na tabela pivô.


## Docker e infraestrutura


O projeto deverá conter:
● docker-compose.yml
● Dockerfile ou Dockerfiles necessários
● Container do PostgreSQL
● Container do Node.js Web Server
● Container do Nginx
● Container ou entrypoint para Node.js CLI, se necessário
O servidor Node.js deverá ficar privado, sem acesso direto pelo host. O acesso externo deverá acontecer
somente pelo Nginx, que funcionará como proxy reverso.
Arquitetura esperada:
Host -> Nginx -> Node Web Server -> PostgreSQL

O comando abaixo deverá executar o projeto sem falhas:
docker compose up --build
Caso esse comando falhe e o projeto não rode, o projeto será zerado.


## Entrypoints e commands


O projeto deverá possuir entrypoints bem definidos na raiz:
● Um entrypoint para o servidor web Node.js
● Um entrypoint para comandos CLI Node.js
Também deverá existir pelo menos um command para executar as migrations.
Exemplo:
node command.js migrate
Ou outro formato equivalente, desde que documentado no README.



## Swagger


Todas as APIs deverão estar documentadas via Swagger.
A documentação deverá conter, para cada entidade, no mínimo, as rotas de:
● list
● get
● create
● update
● delete
Se houver rotas específicas para manipular relacionamentos na tabela pivô, elas também deverão estar
documentadas no Swagger.
A rota da documentação Swagger deverá funcionar e estar explícita no README.md.
Exemplo:
/api-docs


## README.md

O README.md deverá conter:
● Descrição do sistema de APIs
● Entidades, tabelas e relacionamentos
● Indicação da tabela pivô e da relação N:N
● CRUD completo das entidades principais
● Containers utilizados no projeto
● Bibliotecas utilizadas no projeto
● Como realizar login e usar o token JWT
● Rota da documentação Swagger
● Como executar o projeto com Docker
● Como executar as migrations pelo command