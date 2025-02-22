FROM node:14-slim
WORKDIR /cicd
COPY package*.json .
RUN npm install
COPY . .
CMD ["npm", "start"]
