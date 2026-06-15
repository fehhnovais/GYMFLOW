import Progresso from '../models/Progresso.js'

// Busca todos os registros de progresso
async function getAll() {
  return await Progresso.findAll()
}

// Busca um registro pelo id
async function getById(id) {
  const progresso = await Progresso.findByPk(id)
  if (!progresso) throw new Error('Progresso não encontrado')
  return progresso
}

// Cria um novo registro de progresso
async function create(dados) {
  return await Progresso.create(dados)
}

// Atualiza um registro pelo id
async function update(id, dados) {
  const progresso = await getById(id)
  return await progresso.update(dados)
}

// Remove um registro pelo id
async function remove(id) {
  const progresso = await getById(id)
  await progresso.destroy()
}

export default { getAll, getById, create, update, remove }
