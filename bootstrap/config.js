import dotenv from 'dotenv';

dotenv.config();

export default {
    db: {
        host: process.env.POSTGRES_HOST,
        port: process.env.POSTGRES_PORT,
        db: process.env.POSTGRES_DB,
        user: process.env.POSTGRES_USER,
        password: process.env.POSTGRES_PASSWORD
    },
    web: {
        port: process.env.NODE_WEB_PORT
    },
    jwt: {
        secret: process.env.JWT_SECRET
    }
};