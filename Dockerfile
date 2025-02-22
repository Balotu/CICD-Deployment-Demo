FROM node:14-slim
WORKDIR /cicd
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build
RUN npm install -g serve
CMD ["serve", "-s", "build", "-l", "4000"]
