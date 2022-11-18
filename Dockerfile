FROM node:10.15.2
COPY backend /backend
COPY frontend /frontend

WORKDIR /backend
RUN ["npm", "install"]
RUN ["npm", "install", "socket.io"]

EXPOSE 3000
CMD ["npm", "start"]