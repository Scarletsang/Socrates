import { Elm } from "/elm.js"

function main() {
  const app = Elm.Main.init({
    node: document.getElementById('elm')
  });
  const socket = io();
  app.ports.sendMessage.subscribe(function(message) {
    socket.emit('chat message', message);
  });
  socket.on('chat message', function(message) {
    app.ports.receiveMessage.send(message);
  });
}

document.addEventListener("DOMContentLoaded", main);
