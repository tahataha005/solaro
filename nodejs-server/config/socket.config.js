const socketInit = (app, address) => {
    const http = require("http").Server(app);
    const io = require("socket.io")(http);

    //Listening on port and address
    http.listen(process.env.SOCKET_PORT, address, () => {
        console.log(
            `Socket is running on PORT ${process.env.SOCKET_PORT} / IP Address ${address}`
        );
    });
};

module.exports = socketInit;
