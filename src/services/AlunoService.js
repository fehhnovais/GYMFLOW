import Aluno from '../models/Aluno.js'

// Busca todos os alunos cadastrados
async function getAll() {
  return await Aluno.findAll()
}

// Busca um aluno pelo id
// Se não encontrar, lança erro
async function getById(id) {
  const aluno = await Aluno.findByPk(id)
  if (!aluno) throw new Error('Aluno não encontrado')
  return aluno
}

// Cria um novo aluno
async function create(dados) {
  return await Aluno.create(dados)
}

// Atualiza os dados de um aluno pelo id
async function update(id, dados) {
  const aluno = await getById(id)
  return await aluno.update(dados)
}

// Remove um aluno pelo id
async function remove(id) {
  const aluno = await getById(id)
  await aluno.destroy()
}

export default { getAll, getById, create, update, remove }