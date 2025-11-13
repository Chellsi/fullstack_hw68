# syntax=docker/dockerfile:1
FROM node:lts

WORKDIR /app

COPY package*.json ./
COPY vendor ./vendor

RUN npm install --production=false

COPY . .

EXPOSE 3000

CMD ["npm", "run", "start"]
