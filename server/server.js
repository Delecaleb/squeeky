const express = require('express');
const http = require('http');
const socketIO = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socketIO(server);

io.on('connection', (socket) => {
    socket.on('join-user', (userId) => {
        socket.join(userId);
        
        console.log(userId ,'joined ')// Join the socket to a room named after the user ID
      });
  
    console.log('User connected');

  // Listen for 'message' events from clients
  socket.on('message', (data) => {
    console.log('Message from client:', data);

    // Send the message to the specific room identified by the receiver's ID
    io.to(data.receiver_id).emit('message', data);
  });

  // Handle disconnection
  socket.on('disconnect', () => {
    console.log('User disconnected');
  });
});

const PORT = process.env.PORT || 3000;

server.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
