import AuthService from '../services/AuthService.js'

async function register(req, res) {
  try {
    const { nome, email, senha, tipo } = req.body
    // req.body deve conter nome, email, senha e tipo (cliente ou profissional)
    const usuario = await AuthService.register({ nome, email, senha, tipo })
    res.status(201).json(usuario)
    // criado com sucesso, retorna o usuário criado
  } catch (error) {
    res.status(400).json({ erro: error.message })
  }
}

async function login(req, res) {
  try {
    const { email, senha } = req.body
    const resultado = await AuthService.login(email, senha)
    res.status(200).json(resultado)
    // login bem-sucedido, retorna o resultado (token e tipo)
  } catch (error) {
    res.status(401).json({ erro: error.message })
    // login falhou, retorna erro de autenticação
  }
}

export default { register, login }