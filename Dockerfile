# Use a Node.js base image
FROM node:20-alpine

# Set the working directory for the container
WORKDIR /app

# Copy and install client dependencies
WORKDIR /app/client
COPY client/package*.json ./
RUN npm install --legacy-peer-deps
COPY client/ .

# Copy and install server dependencies
WORKDIR /app/server
COPY server/package*.json ./
RUN npm install --legacy-peer-deps
COPY server/ .

# Run the client linter (or another combined script as the default command)
CMD ["npm", "run", "lint", "--prefix", "client"]
