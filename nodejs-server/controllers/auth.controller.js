const User = require("../models/user.model.js");
const bcrypt = require("bcrypt");

//Function to sign up a new user
const signUp = async (req, res) => {
    //Destructuring req data
    const { user_type, email, password } = req.body;

    try {
        const user = new User();

        //Assigning user credentials
        user.user_type = user_type;
        user.email = email;
        user.password = await bcrypt.hash(password, 10);

        //Saving the created user in database
        await user.save();
        res.json(user);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

module.exports = { signUp };
