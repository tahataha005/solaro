const socketInit = (app, address) => {
    const http = require("http").Server(app);
    const io = require("socket.io")(http);

    //On Socket connection
    io.on("connection", socket => {
        console.log("user server started");
        socket.emit("message", "connected to server");

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
