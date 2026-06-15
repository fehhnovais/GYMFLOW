import { Router } from 'express'
import AuthController from '../controllers/AuthController.js'

const router = Router()

/**
 * @swagger
 * /usuarios:
 *   post:
 *     summary: Cadastra um novo usuário
 *     tags: [Usuarios]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [nome, email, senha, tipo]
 *             properties:
 *               nome:
 *                 type: string
 *               email:
 *                 type: string
 *               senha:
 *                 type: string
 *               tipo:
 *                 type: string
 *                 enum: [aluno, trainer, admin]
 *     responses:
 *       201:
 *         description: Usuário criado com sucesso
 *       400:
 *         description: Erro ao criar usuário
 */
router.post('/usuarios', AuthController.register)

/**
 * @swagger
 * /login:
 *   post:
 *     summary: Realiza login e retorna token JWT
 *     tags: [Auth]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [email, senha]
 *             properties:
 *               email:
 *                 type: string
 *               senha:
 *                 type: string
 *     responses:
 *       200:
 *         description: Login realizado com sucesso, retorna token JWT
 *       401:
 *         description: Email ou senha inválidos
 */
router.post('/login', AuthController.login)

export default router