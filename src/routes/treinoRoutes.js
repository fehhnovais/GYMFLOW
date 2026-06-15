import { Router } from 'express'
import TreinoController from '../controllers/TreinoController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router()

/**
 * @swagger
 * /treinos:
 *   get:
 *     summary: Lista todos os treinos
 *     tags: [Treinos]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Lista de treinos
 *       401:
 *         description: Não autorizado
 */
router.get('/', authMiddleware, TreinoController.getAll)

/**
 * @swagger
 * /treinos/{id}:
 *   get:
 *     summary: Busca um treino pelo id
 *     tags: [Treinos]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Treino encontrado
 *       404:
 *         description: Treino não encontrado
 */
router.get('/:id', authMiddleware, TreinoController.getById)

/**
 * @swagger
 * /treinos:
 *   post:
 *     summary: Cria um novo treino
 *     tags: [Treinos]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [nome, aluno_id]
 *             properties:
 *               nome:
 *                 type: string
 *               descricao:
 *                 type: string
 *               aluno_id:
 *                 type: integer
 *               personal_id:
 *                 type: integer
 *     responses:
 *       201:
 *         description: Treino criado com sucesso
 *       400:
 *         description: Erro ao criar treino
 */
router.post('/', authMiddleware, roleMiddleware('trainer', 'admin'), TreinoController.create)

/**
 * @swagger
 * /treinos/{id}:
 *   put:
 *     summary: Atualiza um treino pelo id
 *     tags: [Treinos]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               nome:
 *                 type: string
 *               descricao:
 *                 type: string
 *     responses:
 *       200:
 *         description: Treino atualizado
 *       404:
 *         description: Treino não encontrado
 */
router.put('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), TreinoController.update)

/**
 * @swagger
 * /treinos/{id}:
 *   delete:
 *     summary: Remove um treino pelo id
 *     tags: [Treinos]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       204:
 *         description: Treino removido
 *       404:
 *         description: Treino não encontrado
 */
router.delete('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), TreinoController.remove)

export default router
