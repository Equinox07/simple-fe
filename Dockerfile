FROM node:alpine as base

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx

COPY --from=build /app/build    /usr/share/nginx/html


CMD [ "nginx", "daemon off;" ]