import Treino from '../models/Treino.js'

// Busca todos os treinos
async function getAll() {
  return await Treino.findAll()
}

// Busca um treino pelo id
async function getById(id) {
  const treino = await Treino.findByPk(id)
  if (!treino) throw new Error('Treino não encontrado')
  return treino
}

// Cria um novo treino
async function create(dados) {
  return await Treino.create(dados)
}

// Atualiza um treino pelo id
async function update(id, dados) {
  const treino = await getById(id)
  return await treino.update(dados)
}

// Remove um treino pelo id
async function remove(id) {
  const treino = await getById(id)
  await treino.destroy()
}

export default { getAll, getById, create, update, remove }
