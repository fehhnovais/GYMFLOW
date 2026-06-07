// pega o comando passado no terminal (ex: node command.js migrate)
const command = process.argv[2]

if (command === 'migrate') {
  // executa o arquivo de migration
  import('./database/migrations/001_create_tables.js')
} else {
  console.log('Comando não reconhecido. Use: node command.js migrate')
  process.exit(1)
}