# Use Ubuntu image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Download and extract ngrok
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-stable-linux-amd64.zip && \
    unzip ngrok-stable-linux-amd64.zip -d /usr/local/bin && \
    rm ngrok-stable-linux-amd64.zip

# Set ngrok authtoken
ENV NGROK_AUTH_TOKEN=2e5qBOk0zQUFdRmW9mYATWOWWXS_74htu1PQiQgZsUGfJ7gUS
RUN ngrok authtoken $NGROK_AUTH_TOKEN

# Expose RDP via ngrok
CMD ["ngrok", "tcp", "3389"]
