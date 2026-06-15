import swaggerJsdoc from 'swagger-jsdoc'
import swaggerUi from 'swagger-ui-express'

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'GymFlow API',
      version: '1.0.0',
      description: 'API de gerenciamento de treinos para academias',
    },
    components: {
      securitySchemes: {
        bearerAuth: {
          type: 'http',
          scheme: 'bearer',
          bearerFormat: 'JWT',
          description: 'Insira o token JWT obtido no login'
        }
      }
    },
    security: [{ bearerAuth: [] }]
  },
  apis: ['./src/routes/*.js'],
}

const swaggerSpec = swaggerJsdoc(options)

export { swaggerSpec, swaggerUi }
