import { DataTypes } from 'sequelize'
import sequelize from '../database/connection.js'

const Personal = sequelize.define('Personal', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  usuario_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
}, {
  tableName: 'personais',
  timestamps: true,
})

export default Personal
