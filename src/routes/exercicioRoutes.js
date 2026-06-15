import { Router } from 'express'
import ExercicioController from '../controllers/ExercicioController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router()

/**
 * @swagger
 * /exercicios:
 *   get:
 *     summary: Lista todos os exercicios
 *     tags: [Exercicios]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Lista de exercicios
 *       401:
 *         description: Não autorizado
 */
router.get('/', authMiddleware, ExercicioController.getAll)

/**
 * @swagger
 * /exercicios/{id}:
 *   get:
 *     summary: Busca um exercicio pelo id
 *     tags: [Exercicios]
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
 *         description: Exercicio encontrado
 *       404:
 *         description: Exercicio não encontrado
 */
router.get('/:id', authMiddleware, ExercicioController.getById)

/**
 * @swagger
 * /exercicios:
 *   post:
 *     summary: Cria um novo exercicio
 *     tags: [Exercicios]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [nome, grupo_muscular]
 *             properties:
 *               nome:
 *                 type: string
 *               grupo_muscular:
 *                 type: string
 *               descricao:
 *                 type: string
 *     responses:
 *       201:
 *         description: Exercicio criado com sucesso
 *       400:
 *         description: Erro ao criar exercicio
 */
router.post('/', authMiddleware, roleMiddleware('trainer', 'admin'), ExercicioController.create)

/**
 * @swagger
 * /exercicios/{id}:
 *   put:
 *     summary: Atualiza um exercicio pelo id
 *     tags: [Exercicios]
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
 *               grupo_muscular:
 *                 type: string
 *               descricao:
 *                 type: string
 *     responses:
 *       200:
 *         description: Exercicio atualizado
 *       404:
 *         description: Exercicio não encontrado
 */
router.put('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), ExercicioController.update)

/**
 * @swagger
 * /exercicios/{id}:
 *   delete:
 *     summary: Remove um exercicio pelo id
 *     tags: [Exercicios]
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
 *         description: Exercicio removido
 *       404:
 *         description: Exercicio não encontrado
 */
router.delete('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), ExercicioController.remove)

export default router
