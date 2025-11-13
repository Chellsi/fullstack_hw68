const express = require('express');
const mongoose = require('mongoose');

const PORT = process.env.PORT || 3000;
const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://mongo:27017/docker_express';

const app = express();

app.use(express.json());

app.get('/', (req, res) => {
  res.json({
    message: 'Welcome to the Dockerized Express + MongoDB application!',
    mongo: {
      uri: MONGODB_URI,
      readyState: mongoose.connection.readyState
    }
  });
});

app.get('/health', (req, res) => {
  if (mongoose.connection.readyState === 1) {
    return res.json({ status: 'ok', mongo: 'connected' });
  }

  res.status(503).json({ status: 'degraded', mongo: 'not connected' });
});

async function start() {
  try {
    await mongoose.connect(MONGODB_URI);
    console.log('Connected to MongoDB');
  } catch (error) {
    console.error('MongoDB connection error:', error);
  }

  app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });
}

start();
