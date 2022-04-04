FROM node:16-alpine

EXPOSE 3000

RUN apk

WORKDIR /usr/src

RUN mkdir app && chown -R node:node .

WORKDIR /usr/src/app

COPY --chown=node:node package.json package-lock.json* ./

COPY --chown=node:node . .

USER node

RUN npm install && npm cache clean --force

CMD ["node", "src/index.js"]