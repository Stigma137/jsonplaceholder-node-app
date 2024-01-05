const express = require('express');
const axios = require('axios');

const app = express();
const port = 3000;

// Define a route to fetch and display posts from JSONPlaceholder API
app.get('/posts', async (req, res) => {
  try {
    // Make a GET request to JSONPlaceholder API
    const response = await axios.get('https://jsonplaceholder.typicode.com/posts');

    // Extract the posts from the response data
    const posts = response.data;

    // Send the posts as the API response
    res.json(posts);
  } catch (error) {
    // Handle errors
    console.error('Error fetching posts:', error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.get('/health', (req, res) => {
  res.status(200).send('OK');
});


// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
