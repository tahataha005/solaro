const User = require("../models/user.model.js");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

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

//Authenticating a user
const logIn = async (req, res) => {
    //Destructuring req data
    const { email, password } = req.body;

    //Searching for given email
    const user = await User.findOne({ email });

    //If email not in found return invalid
    if (!user) return res.status(404).json({ message: "Invalid Credentials" });

    //Comparing given pass with hashed user pass
    const passCheck = await bcrypt.compare(password, user.password);

    //If not comparison returned false
    if (!passCheck)
        return res.status(404).json({ message: "Invalid Credentials" });

    //Creating a new token when authenticated
    const token = jwt.sign({ id: user._id, email: user.email }, "sOlArO101");

    //Returning user id and new token
    res.status(200).json({ user_id: user._id, token });
};

module.exports = { signUp, logIn };
