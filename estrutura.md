gymflow/                        ← raiz do projeto
│
├── _web.js                     ← entrypoint do servidor (igual ao professor)
├── command.js                  ← entrypoint CLI (ex: node command.js migrate)
├── package.json
├── .env
├── .env.example
├── .gitignore
├── README.md
│
├── app/
│   └── Controllers/            ← controllers (padrão do professor)
│       ├── AlunoController.js
│       ├── TreinoController.js
│       ├── ExercicioController.js
│       ├── TreinoExercicioController.js
│       ├── HistoricoController.js
│       ├── ProgressoController.js
│       └── AuthController.js   ← login/JWT
│
├── bootstrap/
│   ├── app.js                  ← configura o Express + middlewares + rotas
│   └── config.js               ← carrega variáveis de ambiente
│
├── database/
│   └── connections/
│       └── postgres.js         ← instância do Sequelize
│   └── migrations/             ← migrations (criadas via Sequelize CLI ou manual)
│       └── 001_create_tables.js
│
├── models/                     ← um Model para cada tabela (requisito da prova)
│   ├── Aluno.js
│   ├── Treino.js
│   ├── Exercicio.js
│   ├── TreinoExercicio.js      ← tabela pivô com Model própria (obrigatório!)
│   ├── Historico.js
│   ├── Progresso.js
│   └── Usuario.js
│
├── routes/
│   ├── index.js                ← agrupa todas as rotas
│   ├── aluno.routes.js
│   ├── treino.routes.js
│   ├── exercicio.routes.js
│   ├── treinoExercicio.routes.js
│   ├── historico.routes.js
│   ├── progresso.routes.js
│   └── auth.routes.js          ← rota POST /login
│
├── middlewares/
│   ├── auth.js                 ← valida JWT (protege todas as rotas)
│   └── logger.js               ← log de requisições (middleware extra)
│
├── swagger/
│   └── swagger.js              ← configuração do Swagger/OpenAPI
│
├── public/                     ← arquivos estáticos (Nginx serve daqui)
│
├── storage/                    ← logs, uploads, etc.
│
└── docker/
    ├── node-web/
    │   └── Dockerfile          ← Node.js container (SEM porta exposta ao host)
    ├── nginx/
    │   ├── Dockerfile
    │   └── nginx.conf          ← proxy reverso → nodeweb_host:3000
    └── postgres/
        └── init/
            └── init.sql        ← script inicial do banco (opcional)
│
└── docker-compose.yml          ← orquestra: postgres + nodeweb + nginx