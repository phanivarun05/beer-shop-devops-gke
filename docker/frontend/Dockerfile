# ==========================
# Stage 1 : Builder
# ==========================

FROM node:16-alpine AS builder

ARG APP_PATH=shop
ARG REACT_APP_API_URL=http://localhost:8000

WORKDIR /app

COPY beershopapp/web/${APP_PATH}/package.json beershopapp/web/${APP_PATH}/yarn.lock ./

RUN yarn install --frozen-lockfile

COPY beershopapp/web/${APP_PATH}/ ./

ENV REACT_APP_API_URL=${REACT_APP_API_URL}

RUN yarn build


# ==========================
# Stage 2 : Runtime
# ==========================

FROM nginx:alpine

RUN apk upgrade --no-cache

# Remove the default Nginx configuration and entrypoint scripts.
RUN rm -f /etc/nginx/conf.d/default.conf \
    && rm -rf /docker-entrypoint.d

COPY --from=builder /app/build/ /usr/share/nginx/html/

COPY docker/frontend/nginx.conf /etc/nginx/nginx.conf

# Prepare writable directories for the nginx user.
RUN mkdir -p /var/cache/nginx \
    /var/run/nginx \
    && chown -R nginx:nginx \
       /usr/share/nginx/html \
       /var/cache/nginx \
       /var/run/nginx \
       /etc/nginx

USER nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
