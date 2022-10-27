const controllerMiddleware = (req, res, next) => {
    //Checcking if user type is controller
    try {
        //If true => pass
        if (req.user.user_type === "controller") next();
        //If false => unauthorized
        else res.status(401).json({ message: "Unauthorized" });
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

module.exports = controllerMiddleware;
