import jwt from 'jsonwebtoken'

function authMiddleware(req, res, next) {
  // Pega o header Authorization da requisição
  // Formato esperado: "Bearer eyJhbGc..."
  const authHeader = req.headers.authorization

  // Se não veio nenhum token, bloqueia com 401
  if (!authHeader) {
    return res.status(401).json({ erro: 'Token não fornecido' })
  }

  // Separa "Bearer" do token em si
  // partes[0] = "Bearer", partes[1] = "eyJhbGc..."
  const partes = authHeader.split(' ')

  // Verifica se o formato está correto
  if (partes.length !== 2 || partes[0] !== 'Bearer') {
    return res.status(401).json({ erro: 'Token mal formatado' })
  }

  const token = partes[1]

  try {
    // Verifica se o token é válido e não expirou
    // Se válido, retorna o payload que colocamos no jwt.sign ({ id, tipo })
    const decoded = jwt.verify(token, process.env.JWT_SECRET)

    // Guarda os dados do usuário na requisição
    // Assim os controllers conseguem saber quem está fazendo a requisição
    req.usuario = decoded

    // Libera a requisição para seguir ao controller
    next()
  } catch (error) {
    // Se o token for inválido ou expirado, bloqueia com 401
    return res.status(401).json({ erro: 'Token inválido ou expirado' })
  }
}

export default authMiddleware