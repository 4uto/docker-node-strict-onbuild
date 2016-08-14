FROM node:4

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN npm install -g nsp

ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install
ONBUILD RUN nsp check
ONBUILD COPY . /usr/src/app

CMD [ "npm", "start" ]