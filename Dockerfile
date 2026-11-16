# Use the official Node.js 16 image as the base image.
# It already includes Node.js and npm, so Node doesn't need to be installed on the host machine.
FROM node:16

# Set the working directory inside the container.
# All the commands below run from /app.
WORKDIR /app

# Copy package.json (and package-lock.json if it exists) into the container first.
# This lets Docker cache the dependency layer so rebuilds are faster.
COPY package*.json ./

# Install the app's dependencies listed in package.json.
RUN npm install

# Copy all remaining application files into the container.
COPY . .

# Document that the app listens on port 3000 inside the container.
EXPOSE 3000

# Start the application with npm start when the container runs.
CMD ["npm", "start"]
