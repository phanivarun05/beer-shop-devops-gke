# ==========================
# Stage 1 : Builder
# ==========================

FROM golang:1.24-alpine AS builder

#Set the Build Arguments
ARG SERVICE_PATH=catalog/service

# Set working directory
WORKDIR /app

# Copy dependency files
COPY beershopapp/go.mod beershopapp/go.sum ./

# Download dependencies
RUN go mod download

# Copy source code
COPY beershopapp/. .

# Build the application
RUN go build -o /app/server ./app/${SERVICE_PATH}/cmd/server

# ==========================
# Stage 2 : Runtime
# ==========================

FROM alpine:3.22

# Set the Build Arguments
ARG SERVICE_PATH=catalog/service

# Set working directory
WORKDIR /app

# Copy executable from builder
COPY --from=builder /app/server .

# Copy required configuration files
COPY --from=builder /app/app/${SERVICE_PATH}/configs ./configs

# (Optional) Create non-root user

# (Optional) Switch to non-root user

# Expose application port (optional)
# EXPOSE 8000

# Run the application
ENTRYPOINT ["./server"]

CMD ["-conf", "/app/configs"]