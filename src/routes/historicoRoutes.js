import { Router } from 'express'
import HistoricoController from '../controllers/HistoricoController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router()

// Todos autenticados podem ver historico
// Apenas trainer e admin podem criar/editar/deletar
router.get('/', authMiddleware, HistoricoController.getAll)
router.get('/:id', authMiddleware, HistoricoController.getById)
router.post('/', authMiddleware, roleMiddleware('trainer', 'admin'), HistoricoController.create)
router.put('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), HistoricoController.update)
router.delete('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), HistoricoController.remove)

export default router
