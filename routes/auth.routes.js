const express = require('express');
const router = express.Router();
const authController = require('../controllers/auth.controller');

// Route for show login page
router.get('/', authController.showLogin);

// Route for submiting Login Form
router.post('/login', authController.login);

// Exports the router object so it can be used in other files
module.exports = router;

/*
Browser → GET /
        → auth.routes.js
        → showLogin()
        → login.ejs

Browser → POST /login
        → auth.routes.js
        → login()
        → res.send()

 */
