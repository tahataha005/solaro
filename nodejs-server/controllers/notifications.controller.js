const { admin } = require("../config/notifications/notification.config.js");

const sendNotification = async (req, res) => {
    try {
        //Destructuring req data
        const { registrationToken, title, body } = req.body;

        //Creating a message
        const message = {
            notification: {
                title: title,
                body: body,
            },
            token: registrationToken,
        };

        //Returning success message
        res.status(200).json("Notification sent");
    } catch (error) {
        res.status(400).json(error.message);
    }
};

module.exports = {
    sendNotification,
};
