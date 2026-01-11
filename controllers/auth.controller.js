// Dosplay login page
const showLogin = (req, res) => {
    
    // response is send him to login view
    res.render('auth/login'); 
}

// Handle login form submission
const login = (req, res) => {
    // Extract email and password from the submitted form data
    const { email, password } = req.body;
    res.send('Login submitted');
}

// Exports functions to be accessible by routes
module.exports = {
    showLogin,
    login
};