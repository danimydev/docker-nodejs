#official node apine image
FROM node:16-alpine

#open ports
EXPOSE 3000

#run linux udpates and installs here

#put your env vars below
#ENV PORT=300

WORKDIR /usr/src

#creates app dir inside node and set user permisons
RUN mkdir app && chown -R node:node .

#set app as current dir
WORKDIR /usr/src/app

#copy package and package-lock(if exists)
COPY --chown=node:node package.json package-lock.json* ./

#copy this local dir content inside container
COPY --chown=node:node . .

#select node user
USER node

#install all dependencies
RUN npm install && npm cache clean --force

#run with node instead of npm
CMD ["node", "src/index.js"]