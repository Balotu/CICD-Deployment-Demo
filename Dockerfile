# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --only=production

COPY . .


# Stage 2: Production
FROM node:16-alpine  # Slimmer base image for production

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 4000

CMD ["npm", "start"]
