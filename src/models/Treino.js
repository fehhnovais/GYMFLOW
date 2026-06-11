import { DataTypes } from 'sequelize'
import sequelize from '../database/connection.js'

const Treino = sequelize.define('Treino', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  aluno_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  personal_id: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
  nome: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  descricao: {
    type: DataTypes.TEXT,
  },
}, {
  tableName: 'treinos',
  timestamps: true,
})

export default Treinoimport { DataTypes } from 'sequelize'
import sequelize from '../database/connection.js'

const Treino = sequelize.define('Treino', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  aluno_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  nome: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  descricao: {
    type: DataTypes.TEXT,
  },
}, {
  tableName: 'treinos',
  timestamps: true,
})

export default Treino
