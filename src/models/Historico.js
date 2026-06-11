import { DataTypes } from 'sequelize'
import sequelize from '../database/connection.js'

const Historico = sequelize.define('Historico', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  aluno_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  treino_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  data_execucao: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
  observacoes: {
    type: DataTypes.TEXT,
  },
}, {
  tableName: 'historico',
  timestamps: true,
})

export default Historico
