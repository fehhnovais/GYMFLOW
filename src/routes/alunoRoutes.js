import { Router } from 'express'
import AlunoController from '../controllers/AlunoController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router()

/**
 * @swagger
 * /alunos:
 *   get:
 *     summary: Lista todos os alunos
 *     tags: [Alunos]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Lista de alunos
 *       401:
 *         description: Não autorizado
 */
router.get('/', authMiddleware, roleMiddleware('trainer', 'admin'), AlunoController.getAll)

/**
 * @swagger
 * /alunos/{id}:
 *   get:
 *     summary: Busca um aluno pelo id
 *     tags: [Alunos]
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
 *         description: Aluno encontrado
 *       404:
 *         description: Aluno não encontrado
 */
router.get('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), AlunoController.getById)

/**
 * @swagger
 * /alunos:
 *   post:
 *     summary: Cria um novo aluno
 *     tags: [Alunos]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [nome, usuario_id]
 *             properties:
 *               nome:
 *                 type: string
 *               usuario_id:
 *                 type: integer
 *               personal_id:
 *                 type: integer
 *               idade:
 *                 type: integer
 *               peso:
 *                 type: number
 *               altura:
 *                 type: number
 *               objetivo:
 *                 type: string
 *     responses:
 *       201:
 *         description: Aluno criado com sucesso
 *       400:
 *         description: Erro ao criar aluno
 */
router.post('/', authMiddleware, roleMiddleware('trainer', 'admin'), AlunoController.create)

/**
 * @swagger
 * /alunos/{id}:
 *   put:
 *     summary: Atualiza um aluno pelo id
 *     tags: [Alunos]
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
 *               idade:
 *                 type: integer
 *               peso:
 *                 type: number
 *               altura:
 *                 type: number
 *               objetivo:
 *                 type: string
 *     responses:
 *       200:
 *         description: Aluno atualizado
 *       404:
 *         description: Aluno não encontrado
 */
router.put('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), AlunoController.update)

/**
 * @swagger
 * /alunos/{id}:
 *   delete:
 *     summary: Remove um aluno pelo id
 *     tags: [Alunos]
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
 *         description: Aluno removido
 *       404:
 *         description: Aluno não encontrado
 */
router.delete('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), AlunoController.remove)

export default router
