FROM trenneman/elm-ci:0.19.1 AS build-stage
COPY /frontend /frontend
WORKDIR /frontend
RUN ["npm", "install"]
# Build elm files
RUN ["./node_modules/.bin/elm-esm", "make", "elm/Main.elm", "--optimize", "--output=dist/elm.js"]
# pack all js files
RUN ["./node_modules/.bin/rollup", "-c", "./rollup.config.js"]

FROM node:alpine
COPY /backend /backend
COPY --from=build-stage /frontend/dist /backend/public
WORKDIR /backend
RUN ["npm", "install"]
RUN ["npm", "install", "socket.io"]

EXPOSE 3000
CMD ["npm", "start"]