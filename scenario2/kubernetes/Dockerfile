FROM node:12
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
COPY index.html /app
COPY CSS /app
COPY countapp.js /app
CMD node countapp.js
EXPOSE 8081