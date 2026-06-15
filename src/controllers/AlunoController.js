import AlunoService from '../services/AlunoService.js'

// GET /alunos — lista todos os alunos
async function getAll(req, res) {
  try {
    const alunos = await AlunoService.getAll()
    res.status(200).json(alunos)
  } catch (error) {
    res.status(500).json({ erro: error.message })
  }
}

// GET /alunos/:id — busca um aluno pelo id
async function getById(req, res) {
  try {
    const aluno = await AlunoService.getById(req.params.id)
    res.status(200).json(aluno)
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

// POST /alunos — cria um novo aluno
async function create(req, res) {
  try {
    const aluno = await AlunoService.create(req.body)
    res.status(201).json(aluno)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

// PUT /alunos/:id — atualiza um aluno pelo id
async function update(req, res) {
  try {
    const aluno = await AlunoService.update(req.params.id, req.body)
    res.status(200).json(aluno)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

// DELETE /alunos/:id — remove um aluno pelo id
async function remove(req, res) {
  try {
    await AlunoService.remove(req.params.id)
    res.status(204).send()
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

export default { getAll, getById, create, update, remove }