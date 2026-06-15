import Personal from '../models/Personal.js'

async function getAll() {
  return await Personal.findAll()
}

async function getById(id) {
  const personal = await Personal.findByPk(id)
  if (!personal) throw new Error('Personal não encontrado')
  return personal
}

async function create(dados) {
  return await Personal.create(dados)
}

async function update(id, dados) {
  const personal = await getById(id)
  return await personal.update(dados)
}

async function remove(id) {
  const personal = await getById(id)
  await personal.destroy()
}

export default { getAll, getById, create, update, remove }
