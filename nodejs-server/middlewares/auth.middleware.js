const jwt = require("jsonwebtoken");
const User = require("../models/user.model.js");

//Authenticating user
const authMiddleware = async (req, res, next) => {
    //Get tocken from request => headers => authorizition
    const token = req.headers.authorization?.split(" ")[1];

    //If token is not present return unauthorized
    if (!token) return res.status(401).json({ message: "Unauthorized" });
    try {
        //Decoding token and making sure payload is present in database
        const decoded = jwt.verify(token, process.env.SECRET_KEY);
        const user = await User.findById(decoded.id).populate("user_type");

        //Passing user to request
        req.user = user;

        //Authentication successfull / Pass the middleware
        next();
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

module.exports = authMiddleware;
