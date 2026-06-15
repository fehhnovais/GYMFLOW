import ExercicioService from '../services/ExercicioService.js'

async function getAll(req, res) {
  try {
    const exercicios = await ExercicioService.getAll()
    res.status(200).json(exercicios)
  } catch (error) {
    res.status(500).json({ erro: error.message })
  }
}

async function getById(req, res) {
  try {
    const exercicio = await ExercicioService.getById(req.params.id)
    res.status(200).json(exercicio)
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

async function create(req, res) {
  try {
    const exercicio = await ExercicioService.create(req.body)
    res.status(201).json(exercicio)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

async function update(req, res) {
  try {
    const exercicio = await ExercicioService.update(req.params.id, req.body)
    res.status(200).json(exercicio)
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

async function remove(req, res) {
  try {
    await ExercicioService.remove(req.params.id)
    res.status(204).send()
  } catch (error) {
    res.status(404).json({ erro: error.message })
  }
}

export default { getAll, getById, create, update, remove }
