const mongoose = require("mongoose");

mongoose
    .connect("localhost:27017/solarodb")
    .then(
        console
            .log("Connected to database")
            .catch(err => console.log(`database err ${err}`))
    );
