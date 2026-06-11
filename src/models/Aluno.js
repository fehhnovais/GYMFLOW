import { DataTypes } from 'sequelize'
import sequelize from '../database/connection.js'

const Aluno = sequelize.define('Aluno', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  usuario_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  personal_id: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
  nome: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING(100),
    unique: true,
  },
  idade: {
    type: DataTypes.INTEGER,
  },
  peso: {
    type: DataTypes.DECIMAL(5, 2),
  },
  altura: {
    type: DataTypes.DECIMAL(4, 2),
  },
  objetivo: {
    type: DataTypes.STRING(50),
  },
}, {
  tableName: 'alunos',
  timestamps: true,
})

export default Aluno
