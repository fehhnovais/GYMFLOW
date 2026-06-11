import { DataTypes } from 'sequelize'
import sequelize from '../database/connection.js'

const Usuario = sequelize.define('Usuario', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  nome: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING(100),
    allowNull: false,
    unique: true,
  },
  senha: {
    type: DataTypes.STRING(255),
    allowNull: false,
  },
  tipo: {
    type: DataTypes.STRING(20),
    defaultValue: 'trainer',
  },
}, {
  tableName: 'usuarios',
  timestamps: true,
})

export default Usuario
