Deployment of the mysql on the AWS RDS
========


To run this AWS MYSQL you need to execute:

$ cd scenario2/terraformmysql

$ terraform init

$ terraform plan

$ terraform apply



countapp deployment on the minikube
========

Create countapp.js app
We'll start by creating a simple app, a staple of every web developer's portfolio. The app will use Express, one of the most popular countapp.js frameworks.

Install Node.js and npm
If you've never worked with Node.js before, start by installing npm – the Node.js package manager. Click here to choose the right version for your environment.

Initialize Project and Install Express.js
Create a new directory for the app and initialize a Node project:

#mkdir countapp
# cd counntapp
# npm init
# npm install express --save

Run the app
The application is ready to launch

# node index.js

Go to http://localhost:80/ in your browser to view it.


Create a Dorkerfile 

FROM node:12
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
CMD node countapp.js
EXPOSE 8081


Build the Docker image

# docker build -t [USERNAME]/countapp .

Push the image to the registry

# docker login
# docker push [USERNAME]/countapp

Pulling and running the image on the server

# docker run [USERNAME]/countapp


To do the deployment for minikube, clone the repo and run the following script

./deploy.sh

Run this on the broswer after the deployment have been done.

curl  http://localhost:80