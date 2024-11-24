# Node image
FROM node:20-alpine

# Set working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project to the working directory
COPY . .

# Run linting by default (can override this in `docker run` if needed)
CMD ["npx", "eslint", "."]