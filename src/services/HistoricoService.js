import Historico from '../models/Historico.js'

// Busca todos os registros de historico
async function getAll() {
  return await Historico.findAll()
}

// Busca um registro pelo id
async function getById(id) {
  const historico = await Historico.findByPk(id)
  if (!historico) throw new Error('Historico não encontrado')
  return historico
}

// Cria um novo registro de historico
async function create(dados) {
  return await Historico.create(dados)
}

// Atualiza um registro pelo id
async function update(id, dados) {
  const historico = await getById(id)
  return await historico.update(dados)
}

// Remove um registro pelo id
async function remove(id) {
  const historico = await getById(id)
  await historico.destroy()
}

export default { getAll, getById, create, update, remove }
