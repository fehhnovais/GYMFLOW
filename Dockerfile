# ================================
# ESTÁGIO 1 — Build (instala tudo)
# ================================
FROM node:24-alpine AS builder

WORKDIR /app

# Copia manifests primeiro (otimiza cache — camada menos mutável)
COPY package*.json ./

# Instala TODAS as dependências
RUN npm ci --frozen-lockfile

# ================================
# ESTÁGIO 2 — Runtime (imagem leve)
# ================================
FROM node:24-alpine AS runtime

WORKDIR /app

COPY package*.json ./

# Instala somente dependências de produção
RUN npm ci --frozen-lockfile --omit=dev && \
    npm cache clean --force

# Copia o código (camada mais mutável, sempre no final)
COPY . .

# Usuário não-root (segurança)
RUN addgroup -S gymflow && adduser -S gymflow -G gymflow
USER gymflow

EXPOSE 3000

CMD ["node", "server.js"]