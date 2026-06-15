import { Router } from 'express'
import HistoricoController from '../controllers/HistoricoController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router()

/**
 * @swagger
 * /historico:
 *   get:
 *     summary: Lista todos os registros de historico
 *     tags: [Historico]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Lista de historico
 *       401:
 *         description: Não autorizado
 */
router.get('/', authMiddleware, HistoricoController.getAll)

/**
 * @swagger
 * /historico/{id}:
 *   get:
 *     summary: Busca um registro de historico pelo id
 *     tags: [Historico]
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
router.get('/:id', authMiddleware, HistoricoController.getById)

/**
 * @swagger
 * /historico:
 *   post:
 *     summary: Cria um novo registro de historico
 *     tags: [Historico]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [aluno_id, treino_id, data_execucao]
 *             properties:
 *               aluno_id:
 *                 type: integer
 *               treino_id:
 *                 type: integer
 *               data_execucao:
 *                 type: string
 *                 format: date
 *               observacoes:
 *                 type: string
 *     responses:
 *       201:
 *         description: Registro criado com sucesso
 *       400:
 *         description: Erro ao criar registro
 */
router.post('/', authMiddleware, roleMiddleware('trainer', 'admin'), HistoricoController.create)

/**
 * @swagger
 * /historico/{id}:
 *   put:
 *     summary: Atualiza um registro de historico pelo id
 *     tags: [Historico]
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
 *               data_execucao:
 *                 type: string
 *                 format: date
 *               observacoes:
 *                 type: string
 *     responses:
 *       200:
 *         description: Registro atualizado
 *       404:
 *         description: Registro não encontrado
 */
router.put('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), HistoricoController.update)

/**
 * @swagger
 * /historico/{id}:
 *   delete:
 *     summary: Remove um registro de historico pelo id
 *     tags: [Historico]
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
router.delete('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), HistoricoController.remove)

export default router
