const Router = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const {
    sendNotification,
    testNotification,
} = require("../controllers/notifications.controller.js");

//Creating routes
router.post("/send", sendNotification);
router.post("/test", testNotification);

module.exports = router;
