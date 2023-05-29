const express = require('express');
const app = express();
const port = 3000;

// Define your routes and API endpoints here

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});


app.get('/api/users', (req, res) => {
    // Handle the GET request and send a response
    const users = ['John', 'Jane', 'Bob'];
    res.json(users);
  });
  