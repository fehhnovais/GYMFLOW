import { Router } from 'express'
import ProgressoController from '../controllers/ProgressoController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router()

/**
 * @swagger
 * /progresso:
 *   get:
 *     summary: Lista todos os registros de progresso
 *     tags: [Progresso]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Lista de progresso
 *       401:
 *         description: Não autorizado
 */
router.get('/', authMiddleware, ProgressoController.getAll)

/**
 * @swagger
 * /progresso/{id}:
 *   get:
 *     summary: Busca um registro de progresso pelo id
 *     tags: [Progresso]
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
 *         description: Registro encontrado
 *       404:
 *         description: Registro não encontrado
 */
router.get('/:id', authMiddleware, ProgressoController.getById)

/**
 * @swagger
 * /progresso:
 *   post:
 *     summary: Cria um novo registro de progresso
 *     tags: [Progresso]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [aluno_id, data_registro]
 *             properties:
 *               aluno_id:
 *                 type: integer
 *               peso:
 *                 type: number
 *               percentual_gordura:
 *                 type: number
 *               data_registro:
 *                 type: string
 *                 format: date
 *     responses:
 *       201:
 *         description: Registro criado com sucesso
 *       400:
 *         description: Erro ao criar registro
 */
router.post('/', authMiddleware, roleMiddleware('trainer', 'admin'), ProgressoController.create)

/**
 * @swagger
 * /progresso/{id}:
 *   put:
 *     summary: Atualiza um registro de progresso pelo id
 *     tags: [Progresso]
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
 *               peso:
 *                 type: number
 *               percentual_gordura:
 *                 type: number
 *               data_registro:
 *                 type: string
 *                 format: date
 *     responses:
 *       200:
 *         description: Registro atualizado
 *       404:
 *         description: Registro não encontrado
 */
router.put('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), ProgressoController.update)

/**
 * @swagger
 * /progresso/{id}:
 *   delete:
 *     summary: Remove um registro de progresso pelo id
 *     tags: [Progresso]
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
 *         description: Registro removido
 *       404:
 *         description: Registro não encontrado
 */
router.delete('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), ProgressoController.remove)

export default router
