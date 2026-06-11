import bcrypt from 'bcrypt'
import jwt from 'jsonwebtoken'
import Usuario from '../models/Usuario.js'

const SALT_ROUNDS = 10

async function register({ nome, email, senha, tipo }) {
  // 1. Gera o hash da senha
  const senhaHash = await bcrypt.hash(senha, SALT_ROUNDS)

  // 2. Cria o usuário no banco com a senha já criptografada
  const usuario = await Usuario.create({
    nome,
    email,
    senha: senhaHash,
    tipo,
  })

  // 3. Retorna o usuário sem expor a senha
  const { senha: _, ...usuarioSemSenha } = usuario.toJSON()
  return usuarioSemSenha
}

async function login(email, senha) {
  // 1. Busca o usuário pelo email
  const usuario = await Usuario.findOne({ where: { email } })

  if (!usuario) {
    throw new Error('Email ou senha inválidos')
  }

  // 2. Compara a senha digitada com o hash salvo no banco
  const senhaConfere = await bcrypt.compare(senha, usuario.senha)

  if (!senhaConfere) {
    throw new Error('Email ou senha inválidos')
  }

  // 3. Gera o token JWT contendo id e tipo do usuário
  const token = jwt.sign(
    { id: usuario.id, tipo: usuario.tipo },
    process.env.JWT_SECRET,
    { expiresIn: '8h' }
  )

  return { token, usuario: { id: usuario.id, nome: usuario.nome, email: usuario.email, tipo: usuario.tipo } }
}

export default { register, login }