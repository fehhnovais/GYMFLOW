import { Router } from 'express'
import TreinoExercicioController from '../controllers/TreinoExercicioController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router({ mergeParams: true })

router.get('/', authMiddleware, TreinoExercicioController.getByTreino)
router.get('/:id', authMiddleware, TreinoExercicioController.getById)
router.post('/', authMiddleware, roleMiddleware('trainer', 'admin'), TreinoExercicioController.create)
router.put('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), TreinoExercicioController.update)
router.delete('/:id', authMiddleware, roleMiddleware('trainer', 'admin'), TreinoExercicioController.remove)

export default router
