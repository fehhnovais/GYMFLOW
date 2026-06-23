import 'dotenv/config'
import sequelize from './backend/src/database/connection.js'
import './backend/src/models/index.js'

const command = process.argv[2]

if (command === 'migrate') {
  try {
    await sequelize.sync({ force: false })
    console.log('✅ Tabelas criadas com sucesso!')
    process.exit(0)
  } catch (err) {
    console.error('❌ Erro ao criar tabelas:', err)
    process.exit(1)
  }
} else {
  console.log('Comando não reconhecido. Use: node command.js migrate')
  process.exit(1)
}
