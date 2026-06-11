import { DataTypes } from 'sequelize'
import sequelize from '../database/connection.js'

const TreinoExercicio = sequelize.define('TreinoExercicio', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  treino_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  exercicio_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  series: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  repeticoes: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  carga: {
    type: DataTypes.DECIMAL(5, 2),
  },
}, {
  tableName: 'treino_exercicios',
  timestamps: true,
})

export default TreinoExercicio
