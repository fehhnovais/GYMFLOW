import { Router } from 'express'
import PersonalController from '../controllers/PersonalController.js'
import authMiddleware from '../middlewares/authMiddleware.js'
import roleMiddleware from '../middlewares/roleMiddleware.js'

const router = Router()

// Apenas admin pode gerenciar personais
router.get('/', authMiddleware, roleMiddleware('admin'), PersonalController.getAll)
router.get('/:id', authMiddleware, roleMiddleware('admin'), PersonalController.getById)
router.post('/', authMiddleware, roleMiddleware('admin'), PersonalController.create)
router.put('/:id', authMiddleware, roleMiddleware('admin'), PersonalController.update)
router.delete('/:id', authMiddleware, roleMiddleware('admin'), PersonalController.remove)

export default router
