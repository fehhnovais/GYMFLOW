import TreinoExercicio from '../models/TreinoExercicio.js'

// Busca todos os exercicios de um treino
async function getByTreino(treino_id) {
  return await TreinoExercicio.findAll({ where: { treino_id } })
}

// Busca um registro pelo id
async function getById(id) {
  const item = await TreinoExercicio.findByPk(id)
  if (!item) throw new Error('TreinoExercicio não encontrado')
  return item
}

// Associa um exercicio a um treino
async function create(dados) {
  return await TreinoExercicio.create(dados)
}

// Atualiza series/repeticoes/carga
async function update(id, dados) {
  const item = await getById(id)
  return await item.update(dados)
}

// Remove a associação entre treino e exercicio
async function remove(id) {
  const item = await getById(id)
  await item.destroy()
}

export default { getByTreino, getById, create, update, remove }
