import { Router } from 'express'
import PersonalController from '../controllers/PersonalController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router()

/**
 * @swagger
 * /personais:
 *   get:
 *     summary: Lista todos os personais
 *     tags: [Personais]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Lista de personais
 *       401:
 *         description: Não autorizado
 */
router.get('/', authMiddleware, roleMiddleware('admin'), PersonalController.getAll)

/**
 * @swagger
 * /personais/{id}:
 *   get:
 *     summary: Busca um personal pelo id
 *     tags: [Personais]
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
 *         description: Personal encontrado
 *       404:
 *         description: Personal não encontrado
 */
router.get('/:id', authMiddleware, roleMiddleware('admin'), PersonalController.getById)

/**
 * @swagger
 * /personais:
 *   post:
 *     summary: Cria um novo personal
 *     tags: [Personais]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [usuario_id]
 *             properties:
 *               usuario_id:
 *                 type: integer
 *     responses:
 *       201:
 *         description: Personal criado com sucesso
 *       400:
 *         description: Erro ao criar personal
 */
router.post('/', authMiddleware, roleMiddleware('admin'), PersonalController.create)

/**
 * @swagger
 * /personais/{id}:
 *   put:
 *     summary: Atualiza um personal pelo id
 *     tags: [Personais]
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
 *               usuario_id:
 *                 type: integer
 *     responses:
 *       200:
 *         description: Personal atualizado
 *       404:
 *         description: Personal não encontrado
 */
router.put('/:id', authMiddleware, roleMiddleware('admin'), PersonalController.update)

/**
 * @swagger
 * /personais/{id}:
 *   delete:
 *     summary: Remove um personal pelo id
 *     tags: [Personais]
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
 *         description: Personal removido
 *       404:
 *         description: Personal não encontrado
 */
router.delete('/:id', authMiddleware, roleMiddleware('admin'), PersonalController.remove)

export default router
