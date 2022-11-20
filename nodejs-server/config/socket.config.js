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

        socket.on("reading 6377f0f17d0cd3470f3435a4", reading => {
            console.log(reading);
            io.emit(`live ${reading.item_id}`, reading);
            saveDataScheduller(reading);
        });

        //Reading system live consumption
        socket.on(`reading 6377f0bb7d0cd3470f34359b`, message => {
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
