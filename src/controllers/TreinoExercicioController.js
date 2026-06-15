import TreinoExercicioService from '../services/TreinoExercicioService.js'

// GET /treinos/:treino_id/exercicios — lista exercicios do treino
async function getByTreino(req, res) {
  try {
    const itens = await TreinoExercicioService.getByTreino(req.params.treino_id)
    res.status(200).json(itens)
  } catch (error) {
    res.status(500).json({ erro: error.message })
  }
}

// GET /treinos/:treino_id/exercicios/:id
async function getById(req, res) {
  try {
    const item = await TreinoExercicioService.getById(req.params.id)
    res.status(200).json(item)
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

// POST /treinos/:treino_id/exercicios — associa exercicio ao treino
async function create(req, res) {
  try {
    const dados = { ...req.body, treino_id: req.params.treino_id }
    const item = await TreinoExercicioService.create(dados)
    res.status(201).json(item)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

// PUT /treinos/:treino_id/exercicios/:id
async function update(req, res) {
  try {
    const item = await TreinoExercicioService.update(req.params.id, req.body)
    res.status(200).json(item)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

// DELETE /treinos/:treino_id/exercicios/:id — remove associação
async function remove(req, res) {
  try {
    await TreinoExercicioService.remove(req.params.id)
    res.status(204).send()
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

export default { getByTreino, getById, create, update, remove }
