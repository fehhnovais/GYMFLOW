import { DataTypes } from 'sequelize'
import sequelize from '../database/connection.js'

const Progresso = sequelize.define('Progresso', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  aluno_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  peso: {
    type: DataTypes.DECIMAL(5, 2),
  },
  percentual_gordura: {
    type: DataTypes.DECIMAL(5, 2),
  },
  data_registro: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
}, {
  tableName: 'progresso',
  timestamps: true,
})

export default Progresso
