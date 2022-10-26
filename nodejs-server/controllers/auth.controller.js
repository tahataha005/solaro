const User = require("../models/user.model.js");
const bcrypt = require("bcrypt");

const signUp = async (req, res) => {
    const { user_type, email, password } = req.body;
    const user = new User();

    try {
        user.user_type = user_type;
        user.email = email;
        user.password = await bcrypt.hash(password, 10);

        await user.save();
        res.json(user);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

module.exports = { signup };
