// Recebe os tipos permitidos para acessar a rota
// É uma função que retorna outra função (middleware)
// Exemplo de uso: roleMiddleware('trainer', 'admin')
function roleMiddleware(...tiposPermitidos) {

  // Essa é a função de middleware em si
  return function (req, res, next) {

    // O authMiddleware já colocou os dados do usuário em req.usuario
    // Se não existir, o authMiddleware não foi aplicado antes — erro de configuração
    if (!req.usuario) {
      return res.status(401).json({ erro: 'Usuário não autenticado' })
    }

    // Verifica se o tipo do usuário logado está na lista de tipos permitidos
    // Ex: se tiposPermitidos = ['trainer', 'admin'] e req.usuario.tipo = 'aluno', bloqueia
    const temPermissao = tiposPermitidos.includes(req.usuario.tipo)

    if (!temPermissao) {
      return res.status(403).json({ erro: 'Acesso negado: permissão insuficiente' })
    }

    // Tipo permitido — libera para o controller
    next()
  }
}

export default roleMiddleware