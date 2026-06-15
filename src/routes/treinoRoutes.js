import { Router } from 'express'
import TreinoController from '../controllers/TreinoController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router()

// Trainer e admin podem gerenciar treinos
// Aluno só pode visualizar
router.get('/', authMiddleware, TreinoController.getAll)
router.get('/:id', authMiddleware, TreinoController.getById)
router.post('/', authMiddleware, roleMiddleware('trainer', 'admin'), TreinoController.create)
router.put('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), TreinoController.update)
router.delete('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), TreinoController.remove)

export default router
