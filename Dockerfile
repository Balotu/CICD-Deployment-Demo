# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --only=production && \
    npm cache clean --force

COPY . .


# Stage 2: Production
FROM gcr.io/distroless/nodejs:16 AS production

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 4000

CMD ["npm", "start"]
