// import Express framework from node
const express = require('express');

// create an express server and refer it to app
const app = express();

// get Homepage route 
app.get('/', (req, res) => {

    res.send('Express App works good!');
});

// Starts the server and Makes it listen for incoming requests
const PORT = 3000;

app.listen(PORT, () => {

    // confirm The server is alive
    console.log(`Server running on http://localhost:${PORT}`);
});

