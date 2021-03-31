FROM node:alpine

RUN mkdir /app
WORKDIR /app

COPY ./package.json .

RUN apk add --no-cache bash

RUN npm i

COPY . .

EXPOSE 3001
