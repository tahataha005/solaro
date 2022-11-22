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

        //Sending message
        admin
            .messaging()
            .send(message)
            .then(response => {
                // Response is a message ID string.
                console.log("Successfully sent message:", response);
            })
            .catch(error => {
                console.log("Error sending message:", error);
            });

        //Returning success message
        res.status(200).json("Notification sent");
    } catch (error) {
        res.status(400).json(error.message);
    }
};

module.exports = {
    sendNotification,
};
