const { admin } = require("../config/notifications/notification.config.js");

const sendNotification = async (req, res) => {
    try {
        //Destructuring req data
        const { registrationToken, title, body } = req.body;
    } catch (error) {
        res.status(400).json(error.message);
    }
};

module.exports = {
    sendNotification,
};
