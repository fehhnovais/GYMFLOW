import { Router } from 'express'
import ExercicioController from '../controllers/ExercicioController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router()

// Todos autenticados podem ver exercicios
// Apenas trainer e admin podem criar/editar/deletar
router.get('/', authMiddleware, ExercicioController.getAll)
router.get('/:id', authMiddleware, ExercicioController.getById)
router.post('/', authMiddleware, roleMiddleware('trainer', 'admin'), ExercicioController.create)
router.put('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), ExercicioController.update)
router.delete('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), ExercicioController.remove)

export default router
