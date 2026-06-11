import { DataTypes } from 'sequelize'
import sequelize from '../database/connection.js'

const Exercicio = sequelize.define('Exercicio', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  nome: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  grupo_muscular: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  descricao: {
    type: DataTypes.TEXT,
  },
}, {
  tableName: 'exercicios',
  timestamps: true,
})

export default Exercicio
