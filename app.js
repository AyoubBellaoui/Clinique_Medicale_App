// Import Express framework from node
const express = require('express');
// Create an express server and refer it to app
const app = express();

// Set view engine with EJS
app.set('view engine', 'ejs');

// Middleware function (For any request, if the body is JSON, parse it)
app.use(express.json());
//  Middleware function that parses URL-encoded data (the format used when HTML forms submit data with method="POST")
app.use(express.urlencoded({ extended: true}));
// Any file in public folder becomes accessible to the browser.
app.use(express.static('public'));

// When client req '/' sends it to auth routes
const authroutes = require('./routes/auth.routes');
app.use('/', authroutes);

// Starts the server on PORT 3000 and Makes it listen for incoming requests
const PORT = 3000;
app.listen(PORT, () => {

    // confirm The server is alive
    console.log(`Server running on http://localhost:${PORT}`);
});



