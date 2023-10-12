#!/bin/bash
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.30.0/minikube-darwin-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube
eval $(minikube docker-env)
minikube start 
cd counntapp
npm init
npm install express --save
docker login -u dockerID
docker build -t countapp
docker run -it --rm --name countapp -p 80:80 nginxdemos/countapp:latest
docker tag countapp localhost:5000/nginxdemos/countapp:latest
docker push dockerID/nginxdemos/countapp:latest
kubectl run countapp --image=nginxdemos/countapp:latest --port=80 --image-pull-policy=Never
kubectl apply -f deployment.yml
kubectl apply -f service.yml
kubectl expose deployment countapp --port=80 --type=LoadBalancer
minikube service countapp --url
