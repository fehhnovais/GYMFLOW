import { Sequelize } from "sequelize";
import config from '../../bootstrap/config.js'

const sequelize = new Sequelize(
    config.db.db,
    config.db.user,
    config.db.password,
    {
        host: config.db.host,
        port: config.db.port,
        dialect: 'postgres'
    }
);

export default sequelize;