FROM node:22-alpine
RUN ["mkdir", "-p", "/app/node_modules"]
WORKDIR /app
COPY package*.json ./
RUN ["chown", "-R", "node:node", "/app"]

USER node
RUN ["npm", "install"]
COPY --chown=node:node . .
RUN ["node", "--run", "build"]

CMD ["node", "--run", "start"]