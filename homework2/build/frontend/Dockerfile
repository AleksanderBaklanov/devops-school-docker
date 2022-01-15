FROM node:12-alpine as build
RUN mkdir -p /app
WORKDIR /app
COPY ./docker_homework/frontend /app
COPY ./docker_homework/node_modules /app/node_modules

RUN npm install --save-dev
RUN npm build && \
    npx browserslist@latest --update-db


FROM node:12-alpine
RUN apk add busybox-extras
WORKDIR /app
USER node
COPY --from=build --chown=node:node /app ./

EXPOSE 3000
