# Base Rust environment
FROM rust:1.82 as base

# Set the working directory
WORKDIR /workspace

# Install Node.js and npm for Vite frontend
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Cargo Watch for watching changes on the server and SeaORM CLI for managing database migrations
RUN cargo install cargo-watch sea-orm-cli

# Install rustfmt for formatting Rust files
RUN rustup component add rustfmt

# Expose ports for Actix and Vite
EXPOSE 8080 5173
