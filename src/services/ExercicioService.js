import Exercicio from '../models/Exercicio.js'

// Busca todos os exercicios
async function getAll() {
  return await Exercicio.findAll()
}

// Busca um exercicio pelo id
async function getById(id) {
  const exercicio = await Exercicio.findByPk(id)
  if (!exercicio) throw new Error('Exercicio não encontrado')
  return exercicio
}

// Cria um novo exercicio
async function create(dados) {
  return await Exercicio.create(dados)
}

// Atualiza um exercicio pelo id
async function update(id, dados) {
  const exercicio = await getById(id)
  return await exercicio.update(dados)
}

// Remove um exercicio pelo id
async function remove(id) {
  const exercicio = await getById(id)
  await exercicio.destroy()
}

export default { getAll, getById, create, update, remove }
