import express from 'express'
import config from './config.js'

// cria a aplicação Express
const app = express()

// permite receber JSON no corpo das requisições
app.use(express.json())

// rotas e swagger serão adicionados pela Denise depois
// import router from '../routes/index.js'
// import swaggerUi from 'swagger-ui-express'
// import swaggerDocument from '../swagger/swagger.js'
// import logger from '../middlewares/logger.js'
// app.use(logger)
// app.use(router)
// app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument))

// sobe o servidor na porta definida no .env
app.listen(config.web.port, () => {
  console.log(`Servidor rodando na porta ${config.web.port}`)
})

export default app