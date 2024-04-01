# Use a base image with necessary dependencies
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y wget unzip

# Download and install ngrok
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-stable-linux-amd64.zip && \
    unzip ngrok-stable-linux-amd64.zip && \
    rm ngrok-stable-linux-amd64.zip

# Set ngrok authtoken (replace YOUR_AUTH_TOKEN with your ngrok auth token)
RUN ./ngrok authtoken YOUR_AUTH_TOKEN

# Expose necessary ports (e.g., port 80 for HTTP)
EXPOSE 80

# Command to start ngrok tunnel (replace 80 with the port your service is running on)
CMD ["./ngrok", "http", "80"]
