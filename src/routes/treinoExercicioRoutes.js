import { Router } from 'express'
import TreinoExercicioController from '../controllers/TreinoExercicioController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router({ mergeParams: true })

/**
 * @swagger
 * /treinos/{treino_id}/exercicios:
 *   get:
 *     summary: Lista todos os exercicios de um treino
 *     tags: [TreinoExercicios]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: treino_id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Lista de exercicios do treino
 *       401:
 *         description: Não autorizado
 */
router.get('/', authMiddleware, TreinoExercicioController.getByTreino)

/**
 * @swagger
 * /treinos/{treino_id}/exercicios/{id}:
 *   get:
 *     summary: Busca um exercicio do treino pelo id
 *     tags: [TreinoExercicios]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: treino_id
 *         required: true
 *         schema:
 *           type: integer
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Exercicio do treino encontrado
 *       404:
 *         description: Não encontrado
 */
router.get('/:id', authMiddleware, TreinoExercicioController.getById)

/**
 * @swagger
 * /treinos/{treino_id}/exercicios:
 *   post:
 *     summary: Associa um exercicio a um treino
 *     tags: [TreinoExercicios]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: treino_id
 *         required: true
 *         schema:
 *           type: integer
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [exercicio_id, series, repeticoes]
 *             properties:
 *               exercicio_id:
 *                 type: integer
 *               series:
 *                 type: integer
 *               repeticoes:
 *                 type: integer
 *               carga:
 *                 type: number
 *     responses:
 *       201:
 *         description: Exercicio associado ao treino
 *       400:
 *         description: Erro ao associar exercicio
 */
router.post('/', authMiddleware, roleMiddleware('trainer', 'admin'), TreinoExercicioController.create)

/**
 * @swagger
 * /treinos/{treino_id}/exercicios/{id}:
 *   put:
 *     summary: Atualiza series, repeticoes ou carga
 *     tags: [TreinoExercicios]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: treino_id
 *         required: true
 *         schema:
 *           type: integer
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
 *               series:
 *                 type: integer
 *               repeticoes:
 *                 type: integer
 *               carga:
 *                 type: number
 *     responses:
 *       200:
 *         description: Atualizado com sucesso
 *       404:
 *         description: Não encontrado
 */
router.put('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), TreinoExercicioController.update)

/**
 * @swagger
 * /treinos/{treino_id}/exercicios/{id}:
 *   delete:
 *     summary: Remove a associação entre treino e exercicio
 *     tags: [TreinoExercicios]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: treino_id
 *         required: true
 *         schema:
 *           type: integer
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       204:
 *         description: Associação removida
 *       404:
 *         description: Não encontrado
 */
router.delete('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), TreinoExercicioController.remove)

export default router
