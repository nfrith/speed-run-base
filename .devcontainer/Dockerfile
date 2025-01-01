FROM --platform=linux/arm64 mcr.microsoft.com/devcontainers/base:debian-11

# Update packages and install core dependencies, including bash
RUN apt-get update && apt-get install -y \
    cargo bat fzf ripgrep build-essential procps curl file git bash sudo wget \
    && rm -rf /var/lib/apt/lists/*
