Assignment #4: Application Containerization

This is a simple Node.js web application designed for learning Docker containerization concepts.

Application Overview

This application is a basic Express.js web server that:

Serves a static HTML page at the root (/)
Provides an API status endpoint at /api/status
Includes a health check endpoint at /health
Runs on port 3000 by default (configurable via PORT environment variable)
What's Included
app.js: Main application server file
package.json: Node.js dependencies and project configuration
public/index.html: Static HTML page that confirms successful containerization
public/style.css: Styling for the web page
Running Without Docker (for reference only)

If you wanted to run this application directly (not required for assignment):

bash
npm install
npm start
Your Docker Assignment

DO NOT MODIFY THE APPLICATION CODE

Your task is to containerize this existing application using Docker. You need to:

Create a Dockerfile that properly containerizes this Node.js application
Build a Docker image from your Dockerfile
Run a container from your image
Verify the application works by accessing it in your browser
Starting the Application
To build the docker image run the command:
bash
docker build -t justin-node-app .
To run your docker container in port 3000 run the command:
bash
docker run -d -p 3000:3000 --name node-app justin-node-app
Reflection Question

Answer the following question in the space below: How does containerization with Docker differ from using virtual machines, and why might a development team choose Docker containers over VMs for deploying applications like the one you just containerized?

Virtual machines and Docker containers both let you run apps in their own space, but they work differently. A VM runs a whole separate operating system on your computer, so it takes up a lot of space and memory and takes a while to start up. A Docker container doesn't need its own operating system. It shares the one already on your computer and only packs what the app needs to run. That makes containers a lot smaller and faster.

A team would probably pick Docker for an app like this one because it makes sure the app runs the same way on everyone's computer. The Dockerfile lists exactly what the app needs, like Node 16 and the packages, so nobody has to set that up themselves. I saw this myself. I don't have Node installed, but the app still ran fine inside the container. Docker is also quicker to start and easier to share with a team, so it makes sense for deploying a simple web app like this instead of setting up a whole VM.

Screenshots
App running at localhost:3000

Homepage

API response at localhost:3000/api/status

API Status

Application Requirements for Docker

Your Dockerfile should ensure:

The application has Node.js runtime available
All application files are copied into the container
Dependencies are installed (npm install)
Port 3000 is exposed
The application starts with npm start
The container can be accessed from your host machine
Verification

When your Docker container is running correctly:

Navigate to http://localhost:3000 (or whatever port you mapped)
You should see a success page confirming containerization worked
The /api/status endpoint should return JSON status information
Troubleshooting Tips
Make sure your port mapping is correct in the docker run command
Check that all files are copied into the container
Verify Node.js dependencies are installed in the container
Use docker logs <container-name> to see application output
File Structure Expected
docker-assignment/
├── Dockerfile          # You create this
├── app.js              # Provided
├── package.json        # Provided
├── public/             # Provided
│   ├── index.html      # Provided
│   └── style.css       # Provided
└── README.md           # This file

Good luck with your Docker containerization!