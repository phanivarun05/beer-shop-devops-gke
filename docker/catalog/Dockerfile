# ==========================
# Stage 1 : Builder
# ==========================

FROM golang:1.24-alpine AS builder

# Set working directory
WORKDIR /app

# Copy dependency files
COPY beershopapp/go.mod beershopapp/go.sum ./

# Download dependencies
RUN go mod download

# Copy source code
COPY beershopapp/. .

# Build the application
RUN go build -o /app/catalog ./app/catalog/service/cmd/server

# ==========================
# Stage 2 : Runtime
# ==========================

FROM alpine:latest

# Set working directory
WORKDIR /app

# Copy executable from builder
COPY --from=builder /app/catalog .

# Copy required configuration files
COPY beershopapp/app/catalog/service/configs ./configs

# (Optional) Create non-root user

# (Optional) Switch to non-root user

# Expose application port (optional)
# EXPOSE 8000

# Run the application
ENTRYPOINT ["./catalog"]

CMD ["-conf", "/app/configs"]