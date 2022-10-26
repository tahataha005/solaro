const express = require("express");
require("dotenv").config();
require("./config/db.config.js");

//Initilizing app as express method
const app = express();
app.use(express.json());

//Listening on server port and logging status
app.listen(process.env.PORT, err => {
    if (err) console.log(err);
    else console.log(`Server is running on PORT ${process.env.PORT}`);
});

//Using created routes
const authRoutes = require("./routes/auth.route.js");
app.use("/auth", authRoutes);

const readRoutes = require("./routes/read.route.js");
app.use("/read", readRoutes);
