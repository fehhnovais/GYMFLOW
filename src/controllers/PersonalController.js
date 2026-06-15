import PersonalService from '../services/PersonalService.js'

// GET /personais
async function getAll(req, res) {
  try {
    const personais = await PersonalService.getAll()
    res.status(200).json(personais)
  } catch (error) {
    res.status(500).json({ erro: error.message })
  }
}

// GET /personais/:id
async function getById(req, res) {
  try {
    const personal = await PersonalService.getById(req.params.id)
    res.status(200).json(personal)
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

// POST /personais
async function create(req, res) {
  try {
    const personal = await PersonalService.create(req.body)
    res.status(201).json(personal)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

// PUT /personais/:id
async function update(req, res) {
  try {
    const personal = await PersonalService.update(req.params.id, req.body)
    res.status(200).json(personal)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

// DELETE /personais/:id
async function remove(req, res) {
  try {
    await PersonalService.remove(req.params.id)
    res.status(204).send()
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

export default { getAll, getById, create, update, remove }
