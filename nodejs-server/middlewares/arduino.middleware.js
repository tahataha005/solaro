const arduinoMiddleware = (req, res, next) => {
    const { pass } = req.headers.authorization.pass;

    //Check if the password is correct
    if (!pass || pass !== process.env.ARDUINO_PASS) {
        return res.status(401).json({ message: "Unauthorized" });
    }

    next();
};

module.exports = arduinoMiddleware;
