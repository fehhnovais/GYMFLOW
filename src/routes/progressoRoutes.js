import { Router } from 'express'
import ProgressoController from '../controllers/ProgressoController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router()

// Todos autenticados podem ver progresso
// Apenas trainer e admin podem criar/editar/deletar
router.get('/', authMiddleware, ProgressoController.getAll)
router.get('/:id', authMiddleware, ProgressoController.getById)
router.post('/', authMiddleware, roleMiddleware('trainer', 'admin'), ProgressoController.create)
router.put('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), ProgressoController.update)
router.delete('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), ProgressoController.remove)

export default router
