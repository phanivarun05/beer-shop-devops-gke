# ==========================
# Stage 1 : Builder
# ==========================

FROM node:16-alpine AS builder

# Set the Build Arguments
ARG APP_PATH=shop
ARG REACT_APP_API_URL=http://localhost:8000

# Set working directory
WORKDIR /app

# Copy dependency files
COPY beershopapp/web/${APP_PATH}/package.json beershopapp/web/${APP_PATH}/yarn.lock ./

# Download dependencies
RUN yarn install --frozen-lockfile

# Copy source code
COPY beershopapp/web/${APP_PATH}/ ./

# Set environment variable for React app
ENV REACT_APP_API_URL=${REACT_APP_API_URL}

# Build the application
RUN yarn build

# ==========================
# Stage 2 : Runtime
# ==========================

FROM nginx:alpine

RUN apk upgrade --no-cache

# Copy built application from builder
COPY --from=builder /app/build/ /usr/share/nginx/html/

# Copy Nginx configuration
COPY docker/frontend/nginx.conf /etc/nginx/conf.d/default.conf

# Expose application port (optional)
EXPOSE 80
