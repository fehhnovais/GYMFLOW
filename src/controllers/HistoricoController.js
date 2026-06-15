import HistoricoService from '../services/HistoricoService.js'

async function getAll(req, res) {
  try {
    const historicos = await HistoricoService.getAll()
    res.status(200).json(historicos)
  } catch (error) {
    res.status(500).json({ erro: error.message })
  }
}

async function getById(req, res) {
  try {
    const historico = await HistoricoService.getById(req.params.id)
    res.status(200).json(historico)
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

async function create(req, res) {
  try {
    const historico = await HistoricoService.create(req.body)
    res.status(201).json(historico)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

async function update(req, res) {
  try {
    const historico = await HistoricoService.update(req.params.id, req.body)
    res.status(200).json(historico)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

async function remove(req, res) {
  try {
    await HistoricoService.remove(req.params.id)
    res.status(204).send()
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

export default { getAll, getById, create, update, remove }
