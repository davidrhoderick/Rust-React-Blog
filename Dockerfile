# Base Rust environment
FROM rust:1.72 as base

# Set the working directory
WORKDIR /workspace

# Install Node.js and npm for Vite frontend
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Install SeaORM CLI for managing database migrations
# RUN cargo install sea-orm-cli

# Expose ports for Actix and Vite
EXPOSE 8080 5173
