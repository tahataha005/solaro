const express = require("express");
const path = require("path");
const ip = require("ip");
require("dotenv").config();
require("./config/db.config.js");
require("./schedullers/average.scheduller");
require("./schedullers/cleaner.scheduller");
require("./schedullers/save.data.scheduller");

//Getting current network ip address
const address = ip.address();

//Initilizing app as express method
const app = express();
app.use(express.json());

//Initializing socket
const { init } = require("./config/socket.config")(app, address);
init(app, address);

//Assigning rouet for public folder
app.use(express.static(path.join(__dirname, "./public")));

//Listening on server port and logging status
app.listen(process.env.SERVER_PORT, address, err => {
    if (err) console.log(err);
    else
        console.log(
            `Server is running on PORT ${process.env.SERVER_PORT} / IP Address ${address}`
        );
});

//Importing middlewares
const controllerMiddleware = require("./middlewares/controller.middleware.js");
const authMiddleware = require("./middlewares/auth.middleware.js");

//Using created routes
const authRoutes = require("./routes/auth.route.js");
app.use("/auth", authRoutes);

const readRoutes = require("./routes/read.route.js");
app.use("/read", authMiddleware, readRoutes);

const controlRoutes = require("./routes/control.route.js");
app.use("/control", authMiddleware, controllerMiddleware, controlRoutes);

const dataRoutes = require("./routes/data.route.js");
app.use("/data", dataRoutes);

const arduinoRoutes = require("./routes/arduino.route.js");
app.use("/arduino", arduinoRoutes);

const notificationsRoutes = require("./routes/notifications.route.js");
app.use("/notifications", notificationsRoutes);
