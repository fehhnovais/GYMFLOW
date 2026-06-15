import TreinoService from '../services/TreinoService.js'

// GET /treinos
async function getAll(req, res) {
  try {
    const treinos = await TreinoService.getAll()
    res.status(200).json(treinos)
  } catch (error) {
    res.status(500).json({ erro: error.message })
  }
}

// GET /treinos/:id
async function getById(req, res) {
  try {
    const treino = await TreinoService.getById(req.params.id)
    res.status(200).json(treino)
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

// POST /treinos
async function create(req, res) {
  try {
    const treino = await TreinoService.create(req.body)
    res.status(201).json(treino)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

// PUT /treinos/:id
async function update(req, res) {
  try {
    const treino = await TreinoService.update(req.params.id, req.body)
    res.status(200).json(treino)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

// DELETE /treinos/:id
async function remove(req, res) {
  try {
    await TreinoService.remove(req.params.id)
    res.status(204).send()
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

export default { getAll, getById, create, update, remove }
