1. BACKEND (PASSO A PASSO)

## 1.1 Criar o projeto

mkdir gymflow
cd gymflow
npm init -y

_______________

## 1.2 Instalar dependências

npm install express cors dotenv pg
npm install nodemon --save-dev

_______________

## 1.3 Criar estrutura de pastas

mkdir src
cd src

mkdir controllers routes services models database middlewares
touch app.js

_______________

## 1.4 Estrutura final

src/
├── controllers/
│   └── alunoController.js
├── routes/
│   └── alunoRoutes.js
├── services/
│   └── alunoService.js
├── models/
│   └── alunoModel.js
├── database/
│   └── connection.js
├── middlewares/
└── app.js

_______________

## 1.5 Configurar servidor (app.js)

const express = require('express');
const app = express();

app.use(express.json());

const alunoRoutes = require('./routes/alunoRoutes');
app.use('/alunos', alunoRoutes);

app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000');
});

1.6 Conexão com banco (database/connection.js)

const { Pool } = require('pg');

const pool = new Pool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

module.exports = pool;

_______________

## 1.7 Model (models/alunoModel.js)

const db = require('../database/connection');

const getAll = async () => {
  const result = await db.query('SELECT * FROM alunos');
  return result.rows;
};

module.exports = { getAll };

_______________

## 1.8 Service (services/alunoService.js)

const alunoModel = require('../models/alunoModel');

const listarAlunos = async () => {
  return await alunoModel.getAll();
};

module.exports = { listarAlunos };

_______________

## 1.9 Controller (controllers/alunoController.js)

const alunoService = require('../services/alunoService');

const listar = async (req, res) => {
  const alunos = await alunoService.listarAlunos();
  res.json(alunos);
};

module.exports = { listar };

_______________

## 1.10 Rotas (routes/alunoRoutes.js)

const express = require('express');
const router = express.Router();
const alunoController = require('../controllers/alunoController');

router.get('/', alunoController.listar);

module.exports = router;

_______________

## models/treinoModel.js

const db = require('../database/connection');

const getAll = async () => {
  const result = await db.query('SELECT * FROM treinos');
  return result.rows;
};

const create = async (treino) => {
  const { aluno_id, nome, descricao } = treino;

  const result = await db.query(
    'INSERT INTO treinos (aluno_id, nome, descricao) VALUES ($1, $2, $3) RETURNING *',
    [aluno_id, nome, descricao]
  );

  return result.rows[0];
};

module.exports = { getAll, create };

_______________

## services/treinoService.js

const treinoModel = require('../models/treinoModel');

const listar = async () => {
  return await treinoModel.getAll();
};

const criar = async (data) => {
  return await treinoModel.create(data);
};

module.exports = { listar, criar };


_______________

## controllers/treinoController.js

const treinoService = require('../services/treinoService');

const listar = async (req, res) => {
  const treinos = await treinoService.listar();
  res.json(treinos);
};

const criar = async (req, res) => {
  const treino = await treinoService.criar(req.body);
  res.status(201).json(treino);
};

module.exports = { listar, criar };

_______________

## routes/treinoRoutes.js


const express = require('express');
const router = express.Router();
const controller = require('../controllers/treinoController');

router.get('/', controller.listar);
router.post('/', controller.criar);

module.exports = router;

_______________


## 💪 EXERCÍCIOS

## models/exercicioModel.js

const db = require('../database/connection');

const getAll = async () => {
  const result = await db.query('SELECT * FROM exercicios');
  return result.rows;
};

const create = async (data) => {
  const { nome, grupo_muscular, descricao } = data;

  const result = await db.query(
    'INSERT INTO exercicios (nome, grupo_muscular, descricao) VALUES ($1, $2, $3) RETURNING *',
    [nome, grupo_muscular, descricao]
  );

  return result.rows[0];
};

module.exports = { getAll, create };

_______________

## services/exercicioService.js


const model = require('../models/exercicioModel');

const listar = async () => {
  return await model.getAll();
};

const criar = async (data) => {
  return await model.create(data);
};

module.exports = { listar, criar };

_______________

## controllers/exercicioController.js

const service = require('../services/exercicioService');

const listar = async (req, res) => {
  const dados = await service.listar();
  res.json(dados);
};

const criar = async (req, res) => {
  const novo = await service.criar(req.body);
  res.status(201).json(novo);
};

module.exports = { listar, criar };


_______________

## routes/exercicioRoutes.js

const express = require('express');
const router = express.Router();
const controller = require('../controllers/exercicioController');

router.get('/', controller.listar);
router.post('/', controller.criar);

module.exports = router;


_______________

## 📈 HISTÓRICO

## 📂 models/historicoModel.js


const db = require('../database/connection');

const getByAluno = async (alunoId) => {
  const result = await db.query(
    'SELECT * FROM historico WHERE aluno_id = $1',
    [alunoId]
  );
  return result.rows;
};

const create = async (data) => {
  const { aluno_id, treino_id, data_execucao, observacoes } = data;

  const result = await db.query(
    'INSERT INTO historico (aluno_id, treino_id, data_execucao, observacoes) VALUES ($1, $2, $3, $4) RETURNING *',
    [aluno_id, treino_id, data_execucao, observacoes]
  );

  return result.rows[0];
};

module.exports = { getByAluno, create };


_______________

## services/historicoService.js

const model = require('../models/historicoModel');

const listarPorAluno = async (id) => {
  return await model.getByAluno(id);
};

const criar = async (data) => {
  return await model.create(data);
};

module.exports = { listarPorAluno, criar };


_______________

## controllers/historicoController.js

const service = require('../services/historicoService');

const listarPorAluno = async (req, res) => {
  const dados = await service.listarPorAluno(req.params.id);
  res.json(dados);
};

const criar = async (req, res) => {
  const novo = await service.criar(req.body);
  res.status(201).json(novo);
};

module.exports = { listarPorAluno, criar };

_______________

## routes/historicoRoutes.js

const express = require('express');
const router = express.Router();
const controller = require('../controllers/historicoController');

router.get('/aluno/:id', controller.listarPorAluno);
router.post('/', controller.criar);

module.exports = router;

_______________

## 📊 PROGRESSO

## 📂 models/progressoModel.js

const db = require('../database/connection');

const getByAluno = async (alunoId) => {
  const result = await db.query(
    'SELECT * FROM progresso WHERE aluno_id = $1',
    [alunoId]
  );
  return result.rows;
};

const create = async (data) => {
  const { aluno_id, peso, percentual_gordura, data_registro } = data;

  const result = await db.query(
    'INSERT INTO progresso (aluno_id, peso, percentual_gordura, data_registro) VALUES ($1, $2, $3, $4) RETURNING *',
    [aluno_id, peso, percentual_gordura, data_registro]
  );

  return result.rows[0];
};

module.exports = { getByAluno, create };

_______________

## services/progressoService.js

const model = require('../models/progressoModel');

const listarPorAluno = async (id) => {
  return await model.getByAluno(id);
};

const criar = async (data) => {
  return await model.create(data);
};

module.exports = { listarPorAluno, criar };

_______________

## controllers/progressoController.js

const service = require('../services/progressoService');

const listarPorAluno = async (req, res) => {
  const dados = await service.listarPorAluno(req.params.id);
  res.json(dados);
};

const criar = async (req, res) => {
  const novo = await service.criar(req.body);
  res.status(201).json(novo);
};

module.exports = { listarPorAluno, criar };

_______________

## routes/progressoRoutes.js

const express = require('express');
const router = express.Router();
const controller = require('../controllers/progressoController');

router.get('/aluno/:id', controller.listarPorAluno);
router.post('/', controller.criar);

module.exports = router;
_______________

## 📄 src/app.js

const express = require('express');
const app = express();

app.use(express.json());

/* IMPORTAÇÃO DAS ROTAS */
const alunoRoutes = require('./routes/alunoRoutes');
const treinoRoutes = require('./routes/treinoRoutes');
const exercicioRoutes = require('./routes/exercicioRoutes');
const historicoRoutes = require('./routes/historicoRoutes');
const progressoRoutes = require('./routes/progressoRoutes');

/* USO DAS ROTAS */
app.use('/alunos', alunoRoutes);
app.use('/treinos', treinoRoutes);
app.use('/exercicios', exercicioRoutes);
app.use('/historico', historicoRoutes);
app.use('/progresso', progressoRoutes);

/* SERVIDOR */
app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000');
});


_______________

## 📂 routes/index.js

const express = require('express');
const router = express.Router();

router.use('/alunos', require('./alunoRoutes'));
router.use('/treinos', require('./treinoRoutes'));
router.use('/exercicios', require('./exercicioRoutes'));
router.use('/historico', require('./historicoRoutes'));
router.use('/progresso', require('./progressoRoutes'));

module.exports = router;

______________

E no app.js:

const routes = require('./routes');
app.use(routes);