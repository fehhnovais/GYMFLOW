# imagem base do Node versão 24
FROM node:24

# pasta de trabalho dentro do container
WORKDIR /app

# copia os arquivos de dependências
COPY package*.json ./

# instala as dependências
RUN npm install

# copia o restante do projeto
COPY . .

# porta que o Node vai usar internamente
EXPOSE 3000

# comando para iniciar o servidor
CMD ["npm", "start"]