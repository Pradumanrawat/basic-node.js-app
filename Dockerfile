# Step 1: Use an official Node.js base image
FROM node:18

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Step 4: Copy the rest of the app files
COPY . .

# Step 5: Expose port used by the app
EXPOSE 3000

# Step 6: Define the command to run the app
CMD ["node", "server.js"]
