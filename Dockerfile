FROM node:18-slim
WORKDIR /cicd
COPY package*.json .
RUN npm install
COPY . .
CMD ["npm", "start"]
