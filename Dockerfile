#first stage of rendering image

FROM node:alpine3.14 as build
RUN mkdir -p /restaurant

WORKDIR /restaurant

COPY package.json /restaurant/
RUN npm install

COPY . /restaurant/
RUN npm run build --prod

#Final stage

FROM nginx:alpine
COPY --from=build /app/dist/restaurat /usr/share/nginx/html