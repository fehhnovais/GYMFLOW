import ProgressoService from '../services/ProgressoService.js'

async function getAll(req, res) {
  try {
    const progressos = await ProgressoService.getAll()
    res.status(200).json(progressos)
  } catch (error) {
    res.status(500).json({ erro: error.message })
  }
}

async function getById(req, res) {
  try {
    const progresso = await ProgressoService.getById(req.params.id)
    res.status(200).json(progresso)
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

async function create(req, res) {
  try {
    const progresso = await ProgressoService.create(req.body)
    res.status(201).json(progresso)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

async function update(req, res) {
  try {
    const progresso = await ProgressoService.update(req.params.id, req.body)
    res.status(200).json(progresso)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

async function remove(req, res) {
  try {
    await ProgressoService.remove(req.params.id)
    res.status(204).send()
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

export default { getAll, getById, create, update, remove }
