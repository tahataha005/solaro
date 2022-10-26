const express = require("express");

//Initilizing app as express method
const app = express();

//Listening on server port and logging status
app.listen(8000, err => {
    if (err) console.log(err);
    else console.log("Server is running on PORT 8000");
});
