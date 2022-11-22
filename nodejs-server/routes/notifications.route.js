const Router = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const {
    sendNotification,
} = require("../controllers/notifications.controller.js");

//Creating routes
router.post("/send", sendNotification);

module.exports = router;
