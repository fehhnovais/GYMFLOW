import { Router } from 'express'
import AuthController from '../controllers/AuthController.js'

const router = Router()
//cria um miniroteador para lidar com as rotas de autenticação

router.post('/usuarios', AuthController.register)
// quando chegar uma requisição POST para /usuarios, chama o método register do AuthController
router.post('/login', AuthController.login)
// quando chegar uma requisição POST para /login, chama o método login do AuthController
export default router