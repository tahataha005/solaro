const { saveDataScheduller } = require("../schedullers/save.data.scheduller");

const socketInit = (app, address) => {
    const http = require("http").Server(app);
    const io = require("socket.io")(http);

    //On Socket connection
    io.on("connection", socket => {
        console.log("user server started");
        socket.emit("message", "connected to server");

        //Acknowledging flutter connection
        socket.on("flutter", message => {
            console.log(message);
        });

        socket.on("reading 6377459e06feadc2139ddc2c", reading => {
            console.log(reading);
            io.emit(`live ${reading.item_id}`, reading);
        });

        //Reading system live consumption
        socket.on("reading 6377458a06feadc2139ddc23", message => {
            console.log(message);
            io.emit(`live ${message.system_id}`, message);
        });

        //On socket disconnect
        socket.on("disconnect", function () {
            console.log("user disconnected");
        });
    });

    //Listening on port and address
    http.listen(process.env.SOCKET_PORT, address, () => {
        console.log(
            `Socket is running on PORT ${process.env.SOCKET_PORT} / IP Address ${address}`
        );
    });
};

module.exports = socketInit;
