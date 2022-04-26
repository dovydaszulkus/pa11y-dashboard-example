FROM node:14-alpine

RUN apk update && apk upgrade

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app
USER node

WORKDIR /home/node/app

COPY package.json .
COPY yarn.lock .

RUN yarn install

COPY . .

EXPOSE 4000
EXPOSE 3000

COPY production.json ./config/production.json

CMD NODE_ENV=production node index.js
