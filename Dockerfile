FROM node:latest

# create destination directory
RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app

# Copy files to image
COPY ["./package.json", "./package-lock.json", "/usr/src/nuxt-app/"]

# run npm install before copy ./src can help you cache images
RUN npm install

# copy the app, note .dockerignore
COPY . /usr/src/nuxt-app/

RUN npm run build

EXPOSE 3010

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3010

CMD [ "npm", "start" ]