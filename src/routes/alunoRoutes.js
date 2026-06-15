import { Router } from 'express'
import AlunoController from '../controllers/AlunoController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router()

// Todas as rotas exigem login (authMiddleware)
// Apenas trainer e admin podem gerenciar alunos (roleMiddleware)

// GET /alunos — lista todos
router.get('/', authMiddleware, roleMiddleware('trainer', 'admin'), AlunoController.getAll)

// GET /alunos/:id — busca um
router.get('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), AlunoController.getById)

// POST /alunos — cria novo
router.post('/', authMiddleware, roleMiddleware('trainer', 'admin'), AlunoController.create)

// PUT /alunos/:id — atualiza
router.put('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), AlunoController.update)

// DELETE /alunos/:id — remove
router.delete('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), AlunoController.remove)

export default router