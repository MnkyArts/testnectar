FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Install dependencies after mounting the workspace
COPY package.json package-lock.json ./
RUN npm install

# Expose port for Nuxt.js development server
EXPOSE 3000
