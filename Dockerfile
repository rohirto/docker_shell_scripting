# Use an official Ubuntu base image
FROM ubuntu:latest

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install essential packages for shell scripting and development
RUN apt-get update && apt-get install -y \
    bash \
    vim \
    curl \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set the default working directory
WORKDIR /workspace

# Specify the entry point
CMD ["/bin/bash"]
