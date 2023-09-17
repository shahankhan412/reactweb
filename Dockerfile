FROM node:16-alpine as builderimage

# USER node

# RUN mkdir -p /home/node/app

WORKDIR '/app'

COPY ./package.json ./

RUN npm install

COPY ./ ./

CMD [ "npm","run","build" ]

FROM nginx 
COPY --from=builderimage /app/build /usr/share/nginx/html

# docker run -it -p 4000:3000 -v /home/node/app/node_modules -v ~/frontend:/home/node/app shahan/frontendweb